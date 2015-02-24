class UserMailer < ActionMailer::Base
  default from: "dehinde007@gmail.com"
  
  def welcome_email(user)
   @user = user
   @url = 'http://www.google.com'
   mail(to: @user.email, subject: 'welcome email')
  end
  
  def newcomment_email(comment)
   @comment = comment
   mail(to: comment.micropost.user.email, subject: "Hallit Notify")
   end
  
  def newlike_email(like)
    @like = like
    mail(to: like.micropost.user.email, subject: "Hallit Notify")
  end   
    
end