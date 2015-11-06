class InvitationsController < ApplicationController
  before_action :set_invitation, only: [:show, :edit, :update, :destroy]

  def new
    @invitation = Invitation.new
  end

  def create
  @invitation = Invitation.new(invitation_params)
  @invitation.sender = current_user
  if @invitation.save
      Mailer.invitation(@invitation).deliver
      flash[:notice] = "Thank you, invitation sent."
      redirect_to root_url
    else
      flash[:notice] = "Thank you, we will notify when we are ready."
      redirect_to 
    end
 end
 
    def invitation_params
      params.require(:invitation).permit(:sender_id, :recipient_email)
    end
end
