RSpec.describe 'Privacy' do
  let(:home_page) { HomePage.new }
  let(:settings_page) { SettingsPage.new }
  let(:sign_in_page) { SignInPage.new }
  let(:old_password) { 'old pasword' }
  let!(:user) { create(:user, password: old_password) }

  before do
    login_as(user)
    settings_page.load
  end

  context 'privacy tab' do
    before { settings_page.tab_link_privacy.click } 

    context "change users privacy settings" do
      it 'goes to privacy tab 'do
        expect(settings_page.tab_link_privacy.text).to eq('Privacy')
      end 

      #Email change tests
      it 'cannot change the email' do
        settings_page.privacy_email.set('opapapapapa')
        settings_page.privacy_save_email_button.click

        expect(settings_page).to be_displayed
        expect(settings_page).to have_text('Can`t update email')
      end

      it 'cannot change the email too long' do
        settings_page.privacy_email.set('1@gmail.com'*20)
        settings_page.privacy_save_email_button.click

        expect(settings_page).to be_displayed   
        expect(settings_page).to have_text('Can`t update email')
      end
  
      it 'can change the email' do
        settings_page.privacy_email.set('pupkin@gmail.com')
        settings_page.privacy_save_email_button.click

        expect(settings_page).to be_displayed   
        expect(settings_page).to have_text('Email was update')
      end

      #Password cahnge tests 
      it 'cannot change the password 1 field' do
        settings_page.p_old_password.set('abrakadabra')
        settings_page.privacy_save_password_button.click

        expect(settings_page).to be_displayed   
        expect(settings_page).to have_text('Can`t update password')
      end
  
      it 'cannot change the password not valid old' do
        settings_page.p_old_password.set('abrakadabra')
        settings_page.p_new_password.set('abrakadabra2')
        settings_page.p_confirm_password.set('abrakadabra2')
        settings_page.privacy_save_password_button.click 

        expect(settings_page).to be_displayed 
        expect(settings_page).to have_text('Can`t update password')
      end

      it 'cannot change the password too short' do
        settings_page.p_old_password.set(old_password)
        settings_page.p_new_password.set('12')
        settings_page.p_confirm_password.set('12')
        settings_page.privacy_save_password_button.click 

        expect(settings_page).to be_displayed 
        expect(settings_page).to have_text('Can`t update password')
      end
      
      #bug found test 
      it 'cannot change the password special chars' do
        settings_page.p_old_password.set(old_password)
        settings_page.p_new_password.set('.~!@$!@#!@$!')
        settings_page.p_confirm_password.set('.~!@$!@#!@$!')
        settings_page.privacy_save_password_button.click 

        expect(settings_page).to be_displayed 
        expect(settings_page).to have_text('Can`t update password')
      end

      it 'cannot change the password too long' do
        settings_page.p_old_password.set(old_password)
        settings_page.p_new_password.set('1'*300)
        settings_page.p_confirm_password.set('1'*300)
        settings_page.privacy_save_password_button.click 

        expect(settings_page).to be_displayed 
        expect(settings_page).to have_text('Can`t update password')
      end
  
      it 'can change the password' do
        settings_page.p_old_password.set(old_password)
        settings_page.p_new_password.set('abrakadabra2')
        settings_page.p_confirm_password.set('abrakadabra2')
        settings_page.privacy_save_password_button.click  
        
        expect(sign_in_page).to be_displayed 
        expect(page).to have_text('You need to sign in or sign up before continuing.')
      end
    end      
  end
end
