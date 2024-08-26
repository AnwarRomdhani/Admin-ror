class ResponsesController < ApplicationController
  # Ensure that this controller can access the API
  skip_before_action :verify_authenticity_token

  def create
    @supportticket = Supportticket.find(params[:supportticket_id])
    @response = @supportticket.responses.build(response_params)
    @response.user_id = 3 # Set user_id to 3 for all responses

    if @response.save
      redirect_to @supportticket, notice: 'Response was successfully created.'
    else
      render :new
    end
  end

  private

  def response_params
    params.require(:response).permit(:body)
  end
end
