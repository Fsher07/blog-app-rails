RSpec.describe 'Test Index Page', type: :feature do
  describe 'GET index' do
    before(:each) do
      @first_user = User.create(name: 'Erinc', photo: 'user.png', bio: 'bio1', postscounter: 1)
      @first_user.save!
      @second_user = User.create(name: 'Salim', photo: 'user.png', bio: 'bio2', postscounter: 3)
      @second_user.save!
      @third_user = User.create(name: 'Saningo', photo: 'user.png', bio: 'bio3', postscounter: 5)
      @third_user.save!
    end

    it 'shows the users username' do
      visit root_path
      expect(page).to have_content('Erinc')
      expect(page).to have_content('Salim')
      expect(page).to have_content('Saningo')
    end

    it 'shows the users profile picture' do
      visit root_path
      expect(page).to have_css('img[src*="user.png"]')
      expect(page).to have_css('img[src*="user.png"]')
      expect(page).to have_css('img[src*="user.png"]')
    end

    it 'shows the number of posts of each user' do
      visit root_path
      expect(page).to have_content('1')
      expect(page).to have_content('3')
      expect(page).to have_content('5')
    end
  end
end
