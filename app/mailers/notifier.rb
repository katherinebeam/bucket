class Notifier < ApplicationMailer
  default_url_options[:host] = "localhost:3000"
  default from: "from@example.com"

  def password_reset(user)
    @user = user
    mail(to: "#{user.first_name} #{user.last_name} <#{user.email}>",
         subject: "reset Your Password")
  end
end
