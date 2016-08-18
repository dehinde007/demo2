class UserMailer < ActionMailer::Base
  
default from: '"Hallit" <hallitservice@gmail.com>'

  def welcome_email(user)
   @user = user
   @url = 'http://www.google.com'
   email_with_name = %("#{@user.name.titleize}" <#{@user.email}>)
   mail(to: email_with_name, subject: 'Welcome, thanks for being part of the generation')
  end
  
  def newcomment_email(comment)
   @comment = comment
   email_with_name = %("#{comment.micropost.user.name.titleize}" <#{comment.micropost.user.email}>)
   mail(to: email_with_name, subject: "Happening on your hall")
   end
  
  def newlike_email(like)
    @like = like
    email_with_name = %("#{like.micropost.user.name.titleize}" <#{like.micropost.user.email}>)
    mail(to: email_with_name, subject: "Happening on your hall")
  end   
  
  def newfollow_email(user, follower)
    @user = user
    @follower = follower
    email_with_name = %("#{@user.name.titleize}" <#{@user.email}>)
    mail(to: email_with_name, :subject => "You have a new follower")
  end
    
end
