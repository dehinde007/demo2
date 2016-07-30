class MailerPreview < ActionMailer::Preview
  
  def invitation
    Mailer.invitation(Invitation.first)
  end
  
end