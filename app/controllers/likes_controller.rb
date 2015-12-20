class LikesController < ApplicationController
  before_action :signed_in_user, only: [:show, :edit, :update, :destroy]

def new
     @like = @micropost.likes.new
  end

 def show
     @micropost = Micropost.find(params[:id])
   @likes = @micropost.likes
  end

 def create
        @micropost = Micropost.find(params[:micropost_id])
    @like = Like.new(params[:like].permit(:user_id, :micropost_id))
       @like.micropost = @micropost
       @like.micropost.user = @micropost.user
     @like.user = current_user
     @like.save
       SendNotificationJob.set(wait: 20.seconds).perform_later(@like)
       @like.create_activity :create, owner: current_user
       flash[:notice] = "Hall liked."
       respond_to do |format|
      format.html { redirect_to @like.micropost }
      format.js
      end
    end
    
    def destroy
    @like = Like.find(params[:id])
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
      params.require(:like).permit(:user_id, :micropost_id)
    end
end