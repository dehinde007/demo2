class VerificationsController < ApplicationController
  def new
    @verification = Verification.new
  end

  def create
    @verification = Verification.new(params[:verification])
    @verification.request = request
    if @verification.deliver
      flash[:notice] = 'Thank you for your message. Your request is being processed'
    redirect_to support_path

    end
  end
  
end