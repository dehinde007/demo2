class UserMailerPreview < ActionMailer::Preview
  
  def welcome_email
    UserMailer.welcome_email(User.first)
  end
  
  def newcomment_email
    UserMailer.newcomment_email(Comment.first)
  end
  
  def newlike_email
    UserMailer.newlike_email(Like.first)
  end
  
  def newfollow_email
    UserMailer.newfollow_email(User.first)
  end
  
end