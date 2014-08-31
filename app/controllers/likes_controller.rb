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
    @like = @micropost.likes.create!(like_params)
     @like.user = current_user
     if @like.save
       @like.create_activity :create, owner: current_user
       flash[:success] = "you liked this post"
       redirect_to @micropost
    else
      render 'shared/_like_form'
      end
    end
    
    def destroy
    @like = Like.find(params[:id])
  @like.destroy  
  @like.create_activity :destroy, owner: current_user
     redirect_to @micropost
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