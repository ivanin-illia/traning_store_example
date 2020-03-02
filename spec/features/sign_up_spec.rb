RSpec.describe 'SignUp' do
  # Create an instance of SignUpPage class and assign it to sign_up_page variable
  let(:sign_up_page) { SignUpPage.new }
  # Create an instance of HomePage class and assign it to home_page variable
  let(:home_page) { HomePage.new }
  # Create fake data - email and password
  let(:user_email) { FFaker::Internet.email }
  let(:user_password) { FFaker::Internet.password }

  # Open Sign Up page
  before { sign_up_page.load }

  context 'fill sign up form' do
    # it 'success' do
    #  signup_page.load
    #  signup_page.email_field.set 'vasya@gmail.com'
    #  sleep(2)
    #  signup_page.password_field.set '12345678'
    #  sleep(2)
    #  signup_page.password_confirmation_field.set '12345678'
    #  sleep(2)
    #  signup_page.form_submit.click
    #  expect(page).to have_content('Welcome! You have signed up successfully.')
    #  #binding.pry
    # end

    # it 'clicks facebook icon' do
    #   signup_page.load
    #   signup_page.facebook_icon.click
    #   current_path.should == '/users/auth/facebook'
    # end

    # it 'clicks login link' do
    #   signup_page.load
    #   signup_page.login_link.click
    #   #binding.pry
    # end

    # it 'signs up with empty fields' do
    #   signup_page.load
    #   signup_page.form_submit.click
    #   sleep(3)
    #   expect(signup_page).to have_content('Email can\'t be blank and Email is invalid')
    #   expect(signup_page).to have_content('Password can\'t be blank')
    # end

    context 'with valid data' do
      it 'user signs up' do
        # Fill in user email
        sign_up_page.email.set(user_email)
        # Fill in user password
        sign_up_page.password.set(user_password)
        # Fill in user password confirmation
        sign_up_page.password_confirmation.set(user_password)
        # Click Sign Up button
        sign_up_page.sign_up_button.click
        # Check that Home page opened
        expect(home_page).to be_displayed
        # Check that success message is displayed
        expect(home_page.success_flash.text).to eq('Welcome! You have signed up successfully.')

        #binding.pry
      end
    end
  end
end



