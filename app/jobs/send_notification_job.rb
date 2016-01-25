class SendNotificationJob < ActiveJob::Base
  queue_as :default

  def perform(user)
  @user = user
  UserMailer.welcome_email(@user).deliver_later
  end

  def perform(comment)
  @comment = comment
  UserMailer.newcomment_email(@comment).deliver_later
  end
  
  def perform(like)
  @like = like
  UserMailer.newlike_email(@like).deliver_later
  end
  
  def perform(invitation)
  @invitation = invitation
  Mailer.invitation(@invitation).deliver_later
  end
  
  def perform(user, follower)
  @user = user
  @follower = follower
  UserMailer.mewfollow_email(@user, @follower).deliver_later
  end
  
end
