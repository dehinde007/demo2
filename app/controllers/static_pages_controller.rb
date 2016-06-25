class StaticPagesController < ApplicationController
 
  def home
    if signed_in?
      @feed_items = current_user.feed.paginate(page: params[:page], :per_page => 4)   
          if request.xhr?
      render :partial=>"feeds/feed" 
      end
    else 
      redirect_to signin_path
    end
  end
  
  def welcome
     if signed_in?
      redirect_to home_path
    else 
    
    end
  end
 
  def getstarted
   @skip_header = true
  end
  
  def vision
   @skip_header = true
  end
  
  def search
   @skip_header = true  
   @users = User.find([4])

  end
  
  def support
    @skip_header = true
  end
  
  def howtomakeahall
    @skip_header = true
  end
  
end