class MicropostsController < ApplicationController
  before_action :signed_in_user,  only: [:create, :destroy, :show]
  before_action :correct_user,   only: :destroy
  
  def index
    @microposts = Micropost.all
  end
  
  
  def show
    
     @micropost = Micropost.find(params[:id])
      
   @comments = @micropost.comments
  end
  
  def new
    
    @micropost = Micropost.new
  end


  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Quote created!"
      redirect_to home_path
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @micropost.destroy
    redirect_to current_user
  end

  private

    def micropost_params
      params.require(:micropost).permit(:content, :photo)
    end

    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end
end
