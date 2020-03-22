RSpec.describe 'Settings' do
  let(:home_page) { HomePage.new }
  let(:settings_page) { SettingsPage.new }
  let!(:user) { create(:user) }

  context "open settings page" do
    before do
      login_as(user)
      home_page.load
    end

    it 'goes to settings page' do
      home_page.user_email.hover
      home_page.settings.click
      expect(settings_page).to be_displayed
      expect(settings_page).to have_text ('Settings')
    end
  end

  context "add user's addresses" do
    let!(:user) { create(:user) }
    let(:address) { create(:address, addressable: user) }

    before do
      login_as(user)
      settings_page.load
    end

    it 'add new shipping address' do
      settings_page.shipping_first_name.set(address.first_name)
      settings_page.shipping_last_name.set(address.last_name)
      settings_page.shipping_adress_field.set(address.address)
      settings_page.shipping_city_field.set(address.city)
      settings_page.shipping_zip_field.set(address.zip)
      settings_page.shipping_country_select.select("USA")
      settings_page.shipping_phone_field.set(address.phone)
      settings_page.shipping_save_button.click

      expect(settings_page.shipping_first_name.value).to eq(address.first_name)
      expect(settings_page.shipping_last_name.value).to eq(address.last_name)
      expect(settings_page.shipping_adress_field.value).to eq(address.address)
      expect(settings_page.shipping_city_field.value).to eq(address.city)
      expect(settings_page.shipping_zip_field.value).to eq(address.zip)
      expect(settings_page.shipping_country_select.value).to eq("USA")
      expect(settings_page.shipping_phone_field.value).to eq(address.phone)
    end

    before do
      login_as(user)
      settings_page.load
    end

    it 'shipping validation cant be blank' do  
      settings_page.shipping_save_button.click
  
      expect(settings_page).to have_text ("can't be blank")
      expect(settings_page.text("can't be blank"))
    end
    
    it 'shipping validation over max possible chars' do 
      home_page.user_email.hover
      home_page.settings.click
      settings_page.shipping_first_name.set('1'*51)
      settings_page.shipping_last_name.set('1'*51)
      settings_page.shipping_adress_field.set('1'*21)
      settings_page.shipping_city_field.set('1'*51)
      settings_page.shipping_zip_field.set('1'*6)
      settings_page.shipping_country_select.select("USA")
      settings_page.shipping_phone_field.set('1'*14)
      settings_page.shipping_save_button.click

      expect(settings_page).to have_content ("is too long (maximum is 50 characters)")
      expect(settings_page).to have_content ("is too long (maximum is 20 characters)")
      expect(settings_page).to have_content ("is too long (maximum is 5 characters)")
      expect(settings_page).to have_content ("is too long (maximum is 13 characters)")
      expect(settings_page.shipping_country_select.value).to eq("USA")
    end
  end
end  
