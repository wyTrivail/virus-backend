class AdvisementController < ApplicationController

    def get_ad
	#get ad
	@ad = Advisement.select(:id,:url,:avatar).last
	render plain: response_to(params, @ad.to_json)
    end
  private
    def response_to(req_params, res_params)
      if req_params[:callback].nil?
          res_params
      else
          req_params[:callback] + '(' + res_params + ')'
      end
    end

end
