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
   
  end
  
  def jobs
    
  end
  
  def contact_us
    
  end
  
  def make_hall
    
  end
  
end