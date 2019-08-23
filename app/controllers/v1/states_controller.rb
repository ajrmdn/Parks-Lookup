
class V1::StatessController < ApplicationController
  before_action :authorize_request

  def index
    @states = State.all
    json_response(@states)
  end

  def show
    @state = State.find(params[:id])
    json_response(@state)
  end

  def create
    @state = State.create(state_params)
    json_response(@state)
    render status: 200, json: {
      message: "State park has been created."
    }
  end

  def update
    @state = State.find(params[:id])
    @state.update(state_params)
    render status: 200, json: {
      message: "State park has been updated successfully."
    }
  end

  def destroy
    @state = State.find(params[:id])
    @state.destroy
    render status: 200, json: {
      message: "State park has been destroyed."
    }
  end

  def random
    @state = State.random
    json_response(@state)
  end

  private

  def state_params
    params.permit(:name)
  end
  
end
