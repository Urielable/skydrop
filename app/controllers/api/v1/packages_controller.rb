class Api::V1::PackagesController < ApplicationController
  before_action :set_api_v1_package, only: [:show]
 # before_action :api_v1_package_params, only: [:create]
  skip_before_action :verify_authenticity_token

  # GET /api/v1/packages
  # GET /api/v1/packages.json
  def index
  end

  # GET /api/v1/packages/1
  # GET /api/v1/packages/1.json
  def show

  end

  # POST /api/v1/packages
  # POST /api/v1/packages.json
  def create
    process_tag = -> (tag){
      ProcessTagAction.execute(tag.to_h) 
    }
    save_package = -> (package){
      SavePackageAction.execute(package)
    }
    @packages = api_v1_package_params.map(&process_tag)
    @packages.map(&save_package)
    render :index
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_v1_package
      @api_v1_package = Api::V1::Package.packages_info({id:params[:id]})
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def api_v1_package_params
      params.require(:package).map{|pkg| pkg.permit(:tracking_number, :carrier, parcel: {})}
    end

    def coso_params
      params.fetch(
          :tracking_number, 
          :carrier, 
          parcel_attributes: [ 
            :length, 
            :width, 
            :height, 
            :weight, 
            :distance_unit, 
            :mass_unit 
          ]

      )
    end
end
