class StaticPagesController < ApplicationController
  
  def welcome
    
  end

  def terms
    render :layout => "staticpages"
  end

  def privacy
  end
end
