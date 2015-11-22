class CommentsController < ApplicationController
  
    before_action :signed_in_user,  only: [:create, :destroy, :show]

    def index
        @comments = @micropost.comments.order('id')
    end

    def new
        @comment = @micropost.comments.new
    end

      def create
        @micropost = Micropost.find(params[:micropost_id])
        @comment = Comment.new(params[:comment].permit(:user_id, :comment_id, :body, :micropost_id))
        @comment.micropost = @micropost
        @comment.micropost.user = @micropost.user
        @comment.user = current_user
        @comment.save
        UserMailer.newcomment_email(@comment).deliver
        @comment.create_activity :create, owner:
        current_user
        respond_to do |format|
          format.html {redirect_to @micropost}
          format.js
      end
    end
    
     def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy 
        respond_to do |format|
        format.html { redirect_to @comment.micropost }
        format.js 
   end
  end
  
  def commentactivitydestroy
    @comment.destroy 
    @comment.create_activity :destroy, owner: current_user
  end


    private
    def comment_params
        params.require(:comment).permit(:body, :user_id, :comment_id, :micropost_id)
    end
    
    def set_comment
      @comment = Comment.find(params[:id])
    end

end

