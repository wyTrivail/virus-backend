class PackageController < ApplicationController
  def get_by_version
      version = params[:version]
      max_version = Package.maximum("version")
      if version.to_i < max_version
          @package = Package.where(version: max_version).select(:url,:version,:id)
          render plain: response_to(params, @package.to_json)
      else
          render plain: response_to(params, {:version=>max_version}.to_json)
      end
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
