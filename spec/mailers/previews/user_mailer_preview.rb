class UserMailerPreview < ActionMailer::Preview

  def account_activation
    user = User.second
    user.activation_token = "ALQApxFdy-lZXvooDN-eoQ"
    UserMailer.account_activation user
  end

  def password_reset
    UserMailerMailer.password_reset
  end

end
