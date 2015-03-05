require 'rails_admin/config/actions'
require 'rails_admin/config/actions/base'

module RailsAdminGenerateVersion
end

module RailsAdmin
    module Config
        module Actions
            class GenerateVersion < RailsAdmin::Config::Actions::Base
                RailsAdmin::Config::Actions.register(self)
                register_instance_option :collection do
                    true
                end
                register_instance_option :http_methods do
                    [:get, :post]
                end
                register_instance_option :controller do
                    Proc.new do
                        if request.get?
                            render @action.template_name
                        elsif request.post?
                            all_viri = Virus.select(:id,:en_name,:family_name,:cn_name,:family_cn_des,:family_en_des,:action_des,:avatar,:platform,:virus_type,:found_gmt)
                            Rails.logger.info all_viri
                            max_version = Package.maximum("version")
                            if max_version.nil?
                                max_version = 0
                            end
                            filename = 'viri-' + max_version.to_s
                            filepath = Rails.root.join('public','data-package',filename)
                            open(filepath,'w') do |file|
                                file.puts all_viri.to_json
                            end
                            Package.create({:url=>'http://' + ManageBackend::HOST + '/data-package/' + filename, :version => max_version + 1})
                            redirect_to back_or_index
                        end
                    end
                end

                register_instance_option :link_icon do
                    'icon-share'
                end
            end
        end
    end
end
