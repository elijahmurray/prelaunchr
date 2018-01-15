class UserMailer < ActionMailer::Base
  default from: I18n.t('config.mail.from') + "<" + I18n.t('config.mail.from_email') + ">"
  add_template_helper(ApplicationHelper)

  def signup_email(user_id)
    @user = User.find user_id

    mail(:to => @user.email, :subject => I18n.t('config.mail.subject'))
  end
end
