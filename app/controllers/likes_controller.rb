class LikesController < ApplicationController
  before_action :signed_in_user, only: [:show, :edit, :update, :destroy]


def new
     @like = @micropost.likes.new
end

 def show
   @skip_header = true
   @micropost = Micropost.find(params[:id])
   @likes = @micropost.likes
end

 def create
       @micropost = Micropost.find(params[:micropost_id])
       @like = current_user.likes.new(like_params)
       @like.micropost =  @micropost
       @like.user_id = current_user.id
       @like.save
       UserMailer.delay.newlike_email(@like)
       @like.create_activity :create, owner: current_user
       respond_to do |format|
      format.html { redirect_to @like.micropost }
      format.js
    end
    end

    def destroy 
    @like = Like.find(params[:id])
    @micropost = @like.micropost
    @activity = PublicActivity::Activity.find_by(trackable_id: (params[:id]), trackable_type: controller_path.classify)
    @activity.destroy
    @like.destroy  
     respond_to do |format|
      format.html { redirect_to @like.micropost }
      format.js 
   end   
  end

  
  def likeactivitydestroy
  @like.destroy  
  @like.create_activity :destroy, owner: current_user
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_like
      @like = Like.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def like_params
      params.require(:like).permit(:like_id, :user_id, :micropost_id, :heart)
    end
end