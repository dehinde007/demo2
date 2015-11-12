class FeedsController < ApplicationController
  before_action :signed_in_user
 respond_to :html, :js

  def home
    if signed_in?
      @feed_items = current_user.feed.paginate(page: params[:page], :per_page => 9)   
    else 
      redirect_to signin_path
    end
  end
  
  def feed
    
  end
  
  
end
