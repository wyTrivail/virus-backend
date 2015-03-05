require 'rails_admin/config/actions'
require 'rails_admin/config/actions/base'

module RailsAdminBulkGenerateVersion
end

module RailsAdmin
    module Config
        module Actions
            class BulkGenerateVersion < RailsAdmin::Config::Actions::Base
                RailsAdmin::Config::Actions.register(self)
                register_instance_option :bulkable? do
                    true
                end
                register_instance_option :http_methods do
                    [:post]
                end
                register_instance_option :controller do
                    Proc.new do
                        if params['really'].nil?
                            @objects = list_entries(@model_config, :destroy)
                            render @action.template_name
                        else
                            redirect_to back_or_index
                        end
                    end
                end

            end
        end
    end
end
