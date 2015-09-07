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
        @comment = Comment.new(params[:comment].permit(:user_id, :body, :micropost_id))
        @comment.micropost = @micropost
        @comment.micropost.user = @micropost.user
     @comment.user = current_user
     if @comment.save
       
       @comment.create_activity :create, owner: current_user
       flash[:success] = "Comment created!"
       redirect_to @micropost
    else
      render 'shared/_comment_form'
      end
    end
    
     def destroy
    @comment.destroy 
    @comment.create_activity :destroy, owner: current_user
    redirect_to micropost
  end


    private
    def comment_params
        params.require(:comment).permit(:body, :micropost_id)
    end
    
    def set_comment
      @comment = Comment.find(params[:id])
    end

end

