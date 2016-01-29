class StaticPagesController < ApplicationController
 
  def home
    if signed_in?
      @feed_items = current_user.feed.paginate(page: params[:page], :per_page => 10)   
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
 
  def help
    
  end

  def terms

  end

  def privacy
  end
  
  def vision
   @skip_header = true
  end
  
  def jobs
    @skip_header = true
    
  end
  
  def contact_us
    @skip_header = true
  end
  

  
end