require 'rails_helper'
RSpec.feature 'Users Page' do
  feature 'shows users' do
    background do
      visit root_path
      @user1 = User.create(name: 'John', bio: 'This is my bio',
                           photo: 'user.png')
    end
    scenario 'Shows the username' do
      expect(@user1.name).to have_content('John')
    end

    scenario "Shows the user's photo" do
      all('img').each do |i|
        expect(i[:src]).to eq('/assets/user-6a0e2461f1243cf1747e99dc288fb33916531c513a72989f49e1d8ba0606e3bd.png')
      end
    end

    scenario 'Shows the number of posts' do
      all(:css, '.num_post').each do |post|
        expect(post).to have_content('Number of posts: 0')
      end
    end
  end
end
