class Mailer < ActionMailer::Base
default from: "hallitservice@gmail.com"

def invitation(invitation)
  @invitation = invitation
  mail(to: invitation.recipient_email, subject: "Hallit")
  invitation.update_attribute(:sent_at, Time.now)
end

end
