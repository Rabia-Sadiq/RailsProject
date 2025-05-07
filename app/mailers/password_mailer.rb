class PasswordMailer < ApplicationMailer
  def password_reset
    @user = params[:user]
    @token = params[:token]
    @reset_url = edit_password_reset_url(token: @token)

    mail(
      to: @user.email,
      subject: "Reset your password"
    )
  end
end
