RSpec.describe 'posts/index.html.erb', type: :feature do
  before(:each) do
    @user = User.new(name: 'John', bio: 'Dolphin Trainer',
                     photo: 'https://eitrawmaterials.eu/wp-content/uploads/2016/09/person-icon.png',
                     postscounter: 1)
    @user.save
    5.times do
      Post.create(title: 'First post', text: 'Post content', author_id: @user.id, comments_counter: 0, likes_counter: 0)
    end
    visit(user_posts_path(@user.id))
  end

  it "Shows user's name" do
    expect(page).to have_content @user.name
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
end
