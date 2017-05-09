class UserMailerPreview < ActionMailer::Preview

  def account_activation
    user = User.second
    user.activation_token = "ALQApxFdy-lZXvooDN-eoQ"
    UserMailer.account_activation user
  end

  def password_reset
    user = User.second
    user.reset_token = User.new_token
    UserMailer.password_reset user
  end

end
