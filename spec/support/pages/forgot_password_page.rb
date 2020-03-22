class RestorePasswordPage < BasePage
  set_url '/users/password/new'
  
  element :email, '#user_email'
  element :send_button, '#new_user > div.form-actions > input'
  element :forget_pass_title, '[name="Forgot your password?"]'
end 