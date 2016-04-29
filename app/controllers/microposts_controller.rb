class MicropostsController < ApplicationController
  before_action :signed_in_user,  only: [:new, :create, :destroy, :show]
  before_action :correct_user,   only: :destroy

  def index
    @skip_header = true
    @microposts = Micropost.paginate(page: params[:page], per_page: 15)
  end

  def show
   @micropost = Micropost.find(params[:id])
   @comments = @micropost.comments
      respond_to do |format|
        format.html # show.html.erb
        format.js    
  end
  end
  
  def new
    @skip_header = true
    @micropost = Micropost.new
  end

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:notice] = "Hall created."
      redirect_to home_path
    else
      render 'new'
    end
  end

  def destroy
    @user = User.find_by_username(params[:id])
    @micropost.destroy
    redirect_to current_user
  end

  private

    def micropost_params
      params.require(:micropost).permit(:content, :photo, :author)
    end

    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end
end
