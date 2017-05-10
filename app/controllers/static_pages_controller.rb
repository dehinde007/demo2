class StaticPagesController < ApplicationController

  def home
    if signed_in?
      @feed_items = current_user.feed.paginate(page: params[:page], :per_page => 9)   
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
    
  def about_us
    
  end 
  
  def guide
    @skip_header = true  
  end
  
  def createhall
    @skip_header = true  
  end

  def support
    @skip_header = true  
  end
  
  def terms  
    @skip_header = true  
  end
  
  def youth
    @skip_header = true  
  end
    
  def privacy
    @skip_header = true
  end

  def search
    @skip_header = true  
    @users = User.find([1])
  end
  
end