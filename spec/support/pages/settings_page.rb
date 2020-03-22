class SettingsPage < BasePage
  set_url '/settings'
  element :settings_title, 'h1'
  element :tab_link_address, 'a[href="#address"]'
  element :tab_link_privacy, 'a[href="#privacy"]'
  
  #ADDRESS
  #billing
  element :billing_first_name, '#billing_address_first_name'
  element :billing_last_name, '#billing_address_last_name'
  element :billing_adress_field, '#billing_address_address'
  element :billing_city_field, '#billing_address_city'
  element :billing_zip_field, '#billing_address_zip'
  element :billing_country_select, '#billing_address_country'
  element :billing_phone_field, '#billing_address_phone'
  element :billing_save_button, '#new_billing_address > input.btn'
  
  #shipping
  element :shipping_first_name, '#shipping_address_first_name'
  element :shipping_last_name, '#shipping_address_last_name'
  element :shipping_adress_field, '#shipping_address_address'
  element :shipping_city_field, '#shipping_address_city'
  element :shipping_zip_field, '#shipping_address_zip'
  element :shipping_country_select, '#shipping_address_country'
  element :shipping_phone_field, '#shipping_address_phone'
  element :shipping_save_button, '#new_shipping_address > input.btn'

  #PRIVACY
  element :privacy_email, '#email_form_email'
  element :privacy_save_email_button, '#edit_email_form > input.btn'
  element :p_choose_file_button, 'input[type=button]'
  element :p_save_image_button, '#edit_upload_image > input.btn'
  element :p_remove_account_button, '#delete_account'
  element :p_agreement_checkbox, '#enable_button'
  element :p_old_password, '#password_form_current_password'
  element :p_new_password, '#password_form_password'
  element :p_confirm_password, '#password_form_password_confirmation'
  element :privacy_save_password_button, '#edit_password_form > input[type=submit]'
end
