class Mailer < ActionMailer::Base
default from: '"Hallit" <hallitservice@email.com>'

def invitation(invitation)
  @invitation = invitation
  mail(to: invitation.recipient_email, subject: "Tidings")
  invitation.update_attribute(:sent_at, Time.now)
end

end
