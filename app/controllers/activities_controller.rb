class ActivitiesController < ApplicationController
  before_action :signed_in_user
  def index
    @skip_header = true
    @activities = PublicActivity::Activity.order("created_at desc").where(owner_id: current_user.followed_users, owner_type: "User").paginate(page: params[:page], :per_page => 20)  
    
  end
  
end
