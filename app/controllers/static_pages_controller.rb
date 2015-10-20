class StaticPagesController < ApplicationController
  
  def welcome
     if signed_in?
      redirect_to home_path
    else 
    
    end
  end
  
  def help
    
  end

  def terms
    render :layout => "staticpages"
  end

  def privacy
  end
  
  def about_us
   
  end
  
  def jobs
    
  end
  
  def contact_us
    
  end
  
  def make_hall
    
  end
  
end