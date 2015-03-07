#encoding: utf-8
require Rails.root.join('lib','rails_admin_generate_version')
require Rails.root.join('lib','rails_admin_bulk_generate_version')
RailsAdmin.config do |config|
    
  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration
  #module RailsAdmin
    #module Config
        #module Actions
            #class GenerateVersion < RailsAdmin::Config::Actions::Base
                #RailsAdmin::Config::Actions.register(self)
            #end
        #end
    #end
  #end
  module RailsAdmin
    module Config
        module Actions
            class BulkGenerateVersion < RailsAdmin::Config::Actions::Base
                RailsAdmin::Config::Actions.register(self)
            end
        end
    end
  end

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    #export
    bulk_delete
    show
    edit
    delete
    show_in_app
    generate_version do 
        visible do
            bindings[:abstract_model].model.to_s == "Virus"
        end
    end

    bulk_generate_version do
        visible do
            bindings[:abstract_mode].mode.to_s == "Virus"
        end
    end
    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end


  config.model 'Virus' do
    show do
        field :en_name do
            label '病毒名称'
        end
        field :cn_name do
            label '中文俗名'
        end
        field :virus_type, :enum do
            label '类别'
            enum do
                Hash['未分类'=>0,'蠕虫'=>1,'感染式病毒'=>2,'木马'=>3,'黑客工具'=>4,'间谍软件'=>5,'风险软件'=>6,'垃圾文件'=>7,'测试文件'=>8]
            end
        end
        field :platform, :enum do
            label '平台'
            enum do
                Hash['未分类'=>0, '电脑'=>1,'移动终端'=>2]
            end
        end
        field :found_gmt do
            label '发现时间'
        end
        field :family_cn_des do
            label '中文说明'
        end

        field :family_en_des do
            label '英文说明'
        end

        field :avatar do
            label '图片'
        end

    end
    list do
        field :en_name do
            label '病毒名称'
        end
        field :cn_name do
            label '中文俗名'
        end
        field :virus_type, :enum do
            label '类别'
            enum do
                Hash['未分类'=>0,'蠕虫'=>1,'感染式病毒'=>2,'木马'=>3,'黑客工具'=>4,'间谍软件'=>5,'风险软件'=>6,'垃圾文件'=>7,'测试文件'=>8]
            end
        end
        field :platform, :enum do
            label '平台'
            enum do
                Hash['未分类'=>0, '电脑'=>1,'移动终端'=>2]
            end
        end
        field :found_gmt do
            label '发现时间'
        end
    end

    edit do
        field :en_name do
            label '病毒名称'
        end
        field :cn_name do
            label '中文俗名'
        end
        field :virus_type, :enum do
            label '类别'
            enum do
                Hash['未分类'=>0,'蠕虫'=>1,'感染式病毒'=>2,'木马'=>3,'黑客工具'=>4,'间谍软件'=>5,'风险软件'=>6,'垃圾文件'=>7,'测试文件'=>8]
            end
        end
        field :platform, :enum do
            label '平台'
            enum do
                Hash['未分类'=>0, '电脑'=>1,'移动终端'=>2]
            end
        end
        field :found_gmt do
            label '发现时间'
        end

        field :family_cn_des do
            label '中文说明'
        end

        field :family_en_des do
            label '英文说明'
        end

        field :avatar do
            label '图片'
        end
    end
  end
end
