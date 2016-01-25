class UsersController < ApplicationController
  before_action :signed_in_user,
                only: [:index, :show, :edit, :update, :destroy, :following, :followers, :verify, :ver]
  before_action :correct_user,   only: [:edit, :update, :destroy, :ver, :verify]
  before_action :admin_user,     only: :destroy
  
  def index
    @skip_header = true
    @users = User.search(params[:search]).paginate(page: params[:page], per_page: 30).order('created_at DESC')
  end

  def show
    @skip_header = true
    @user = User.find_by_username(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page], per_page: 12)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
   UserMailer.delay.welcome_email(@user)
      sign_in @user
      flash[:success] = "Welcome to Hallit"
      redirect_to help_path
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def verify
    @userr = User.find_by_username(params[:id])
  end
  
    def ver
    if @userr.update_attributes(user_params)
      flash[:success] = "Verified"
      redirect_to @user
    else
      render 'verify'
    end
  end

  def destroy
    User.find_by_username(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_url
  end

  def following
    @title = "Following"
    @user = User.find_by_username(params[:id])
    @users = @user.followed_users.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find_by_username(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  private

    def user_params
      params.require(:user).permit(:name, :username, :avatar, :verify, :bio, :email, :password, 
                                   :password_confirmation)
    end

    # Before filters

    def correct_user
      @user = User.find_by_username(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
  end
