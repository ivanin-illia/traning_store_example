class SignInPage < BasePage
  set_url '/users/sign_in'
  element :facebook_icon, '.fa-facebook-official'
  element :email, '#user_email'
  element :password, '#user_password'
  element :login_button, '[name="commit"]'
  element :back_to_store, 'a[href="/books"]'
  element :forgot_password_link, 'a[href="/users/password/new"]'
end
