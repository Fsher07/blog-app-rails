require_relative '../../rails_helper'

RSpec.describe 'posts/index.html.erb', type: :feature do
  before(:each) do
    @user_new = User.create(name: 'John', bio: 'Dolphin Trainer',
                            photo: 'user.png',
                            postscounter: 1)
    5.times do
      Post.create(title: 'First post', text: 'Post content', author_id: @user_new.id, comments_counter: 0,
                  likes_counter: 0)
    end
    visit(user_posts_path(@user_new.id))
  end

  it "Shows user's name" do
    expect(page).to have_content @user_new.name
  end

  it "shows user's profile picture" do
    all('img').each do |i|
      expect(i[:alt]).to eq('rss feed')
    end
  end

  it "shows see a post's title" do
    expect(page).to have_content('John')
  end

  it 'I should see how many likes a post has' do
    expect(page).to have_content 'Likes: 0'
  end

  it 'shows number of posts of user has written' do
    visit(user_posts_path(@user_new.id))
    post = Post.all
    expect(post.size).to eql(12)
  end

  it "shows some of the post's body" do
    expect(page).to have_content('content')
  end
end
