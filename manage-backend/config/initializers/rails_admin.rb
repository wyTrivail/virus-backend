#encoding: utf-8
require Rails.root.join('lib','rails_admin_generate_version')
RailsAdmin.config do |config|
  config.main_app_name = ["病毒数据管理系统",""]  
  ### Popular gems integration

  ## == Devise ==
  #config.authenticate_with do
     #warden.authenticate! scope: :user
  #end
  #config.current_user_method(&:current_user)
  config.authorize_with do
    authenticate_or_request_with_http_basic('Site Message') do |username, password|
      username == 'wangying' && password == 'wangying'
    end
  end

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
  config.excluded_models << "User"
  config.excluded_models << "Package"
  config.actions do
    dashboard
    new
    index 
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

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end

  
  config.model 'Virus' do
        field :en_name do
            label '病毒名称'
        end
	field :cn_name do
	    label '中文俗名'
	end
	field :virus_type, :enum do
	    searchable true
	    filterable true
	    queryable false
	    label '类别'
	    enum do
		Hash['未分类'=>0,'蠕虫'=>1,'感染式病毒'=>2,'木马'=>3,'黑客工具'=>4,'间谍软件'=>5,'风险软件'=>6,'垃圾文件'=>7,'测试文件'=>8]
	    end
	end
	field :platform, :enum do
            searchable true
	    filterable true
	    queryable false
	    label '平台'
	    enum do
		Hash['未分类'=>0, '电脑'=>1,'移动终端'=>2]
	    end
	end
	field :found_gmt do
	    label '发现时间'
	end

	field :family_cn_des do
            searchable false
	    label '中文说明'
	end

	field :family_en_des do
	    searchable false
	    label '英文说明'
	end

	field :avatar do
	    searchable false
	    label '图片'
	end

   
  end
  config.model 'Advisement' do
    list do 
	field :url do
            label '广告链接'
        end
	
	field :des do
	    label '描述'
        end
	field :updated_at do
	    label '更新时间'
	end
    end
    show do 
	field :url do
            label '广告链接'
        end
	
	field :des do
	    label '描述'
        end

	field :avatar do
	    label '图片'
	end
    end

    edit do
	field :url do
	    label '广告链接'
	end
	field :avatar do
            label '图片'
	end
	field :des do
	    label '描述'
	end
     end
  end

end
