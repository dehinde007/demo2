class FeedsController < ApplicationController
  before_action :signed_in_user
  def home
    if signed_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page], :per_page => 13)
      @comments = @micropost.comments
      @likes = @micropost.likes
      
    else 
      redirect_to signin_path
    end
  end
  
end
