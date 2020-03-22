RSpec.describe 'LogOut' do
  let(:sign_in_page) { SignInPage.new }
  let(:home_page) { HomePage.new }
  let(:user) { create(:user) }

  before do
    login_as(user)
    home_page.load
  end

  context 'from the home page' do

    it 'user logs out' do
      home_page.user_email.hover
      home_page.logout.click

      expect(home_page.success_flash.text).to eq((I18n.t('devise.sessions.signed_out')))
      expect(home_page).to have_no_user_email
    end
  end
end
