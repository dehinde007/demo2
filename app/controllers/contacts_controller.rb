class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash[:notice] = 'Thanks, Your message is being processed'
    redirect_to support_path
    else
      flash[:error] = 'Cannot send message.'
      render :new
    end
  end
end