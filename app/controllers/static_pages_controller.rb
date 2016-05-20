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
    render :layout => "getstart"
  end

  def terms

  end

  def privacy
  end
  
  def vision
   @skip_header = true
  end
  
  def search
   @skip_header = true  
   @users = User.find([1])

  end
  
  def jobs
    @skip_header = true
    
  end
  
  def support
    @skip_header = true
  end
  
    def howto
    render :layout => "ht"
  end
  

  
end