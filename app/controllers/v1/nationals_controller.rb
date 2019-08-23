class V1::NationalsController < ApplicationController
  before_action :authorize_request

  def index
    @nationals = National.all
    json_response(@nationals)
  end

  def show
    @national = National.find(params[:id])
    json_response(@national)
  end

  def create
    @national = National.create(national_params)
    json_response(@national)
    render status: 200, json: {
      message: "National park has been created."
    }
  end

  def update
    @national = National.find(params[:id])
    @national.update(national_params)
    render status: 200, json: {
      message: "National park has been updated successfully."
    }
  end

  def destroy
    @national = National.find(params[:id])
    @national.destroy
    render status: 200, json: {
      message: "National park has been destroyed."
    }
  end

  def random
    @national = National.random
    json_response(@national)
  end

  private

  def national_params
    params.permit(:name)
  end

end
