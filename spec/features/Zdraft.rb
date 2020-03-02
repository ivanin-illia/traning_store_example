# RSpec.describe 'Test' do
#   it 'view the initial page' do
#     visit('/')
#     expect(page).to have_content('price')
#     expect(page).to have_text('Catalog')
#     expect(page).to have_text('Can\`t find books')
#     expect(page).to have_button('Search')
#   end
# end
RSpec.describe 'Home page' do
  context 'without books' do
    before { visit '/' }
    it 'shows no books image' do
      expect(page).to have_content('Catalog')
      expect(page).to have_content('Can`t find books')
      file_src = '/assets/fallback/no_books-0a35a1b14b85c223a9d0c8bf0ea4cd29588f68cb35744963bb6c12d365118919.jpg'
      expect(find('#no_books img')[:src]).to include(file_src)
    end
    it 'shows ALL link with 0 count' do
      within(:xpath, '(//ul[contains(@class, "list-inline")]/li)[1]') do
        # expect(page).to have_xpath('.//a', text: 'All')
        # expect(page).to have_xpath('.//span', text: '0')
        expect(find(:xpath, './/a').text).to include('All')
        expect(find(:xpath, './/span').text).to eq('0')
      end
    end
  end
end

