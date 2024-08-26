class SupportticketsController < ApplicationController
  def index
    response = HTTParty.get("http://localhost:3000/api/v1/supporttickets")
    if response.success?
      @supporttickets = JSON.parse(response.body)
    else
      @supporttickets = []
      flash[:alert] = 'Failed to fetch tickets.'
    end
  end

  def show
    response = HTTParty.get("http://localhost:3000/api/v1/supporttickets/#{params[:id]}")
    if response.success?
      @supportticket = JSON.parse(response.body)
      Rails.logger.debug("API Response: #{@supportticket.inspect}")  # Log the response for debugging
    else
      @supportticket = nil
      flash[:alert] = 'Failed to fetch ticket.'
      redirect_to supporttickets_path
    end
  end

  def destroy
    response = HTTParty.delete("http://localhost:3000/api/v1/supporttickets/#{params[:id]}")
    if response.success?
      redirect_to supporttickets_path, notice: 'Ticket was successfully destroyed.'
    else
      redirect_to supporttickets_path, alert: 'Failed to destroy the ticket.'
    end
  end

  def close_ticket
    # Get the current date and time
    closed_date = Time.current.iso8601
  
    response = HTTParty.patch("http://localhost:3000/api/v1/supporttickets/#{params[:id]}", 
                              body: { supportticket: { status: 'closed', closed_date: closed_date } }.to_json,
                              headers: { 'Content-Type' => 'application/json' })
                              
    if response.success?
      redirect_to supporttickets_path, notice: 'Ticket was successfully closed.'
    else
      redirect_to supporttickets_path, alert: 'Failed to close the ticket.'
    end
  end
  
  def create_response
    url = "http://localhost:3000/api/v1/supporttickets/#{params[:id]}/responses"
    body = { response: { body: params[:body], user_id: 3 } }.to_json

    response = HTTParty.post(url, 
                             body: body,
                             headers: { 'Content-Type' => 'application/json',
                                        'Authorization' => 'Basic ' + Base64.encode64("admin@example.com:password") })

    if response.success?
      redirect_to supportticket_path(params[:id]), notice: 'Response was successfully created.'
    else
      flash[:alert] = response['errors'].join(', ')
      render 'show'
    end
  end
end
