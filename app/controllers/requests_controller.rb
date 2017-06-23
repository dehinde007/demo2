class RequestsController < ApplicationController
  def new
    @request = Request.new
  end

  def create
    @request = Request.new(params[:contact])
    @request.request = request
    if @request.deliver
      flash.now[:notice] = 'Thank you for your message. Your request is being processed'
    else
      flash.now[:error] = 'Cannot send message.'
      render :new
    end
  end
end