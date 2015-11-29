class VerifiesController < ApplicationController
def index
  @verifies = Verify.all
end


def show 
  @verify = Verify.find(params[:id])
end
  
def new
  @verify = Verify.new
end  
  
def create
     @currentUser = current_user.id
     @verify = Verify.new(params[:verify].permit(:user_id))
     @verify.user = current_user
    if @verify.save
      flash[:success] = "Success"
      redirect_to home_path
    else
      render 'new'
    end
end

def destroy
    @verify.destroy
    redirect_to current_user
end
  
  
  
  
private
  def verify_params
  params.require(:verify).permit(:verified, :user_id)
  end  
  
end
