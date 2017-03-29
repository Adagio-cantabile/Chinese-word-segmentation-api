class UserMailer < ActionMailer::Base
  default :from => "postmaster@info.chinese-word-segmentation.club"

  def registration_confirmation(user)
    @user = user
    mail(:to => "#{user.name} <#{user.email}>", :subject => "Registration Confirmation")
  end
end
