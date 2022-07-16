require 'rails_helper'

RSpec.describe User, type: :model do
  before(:all) do
    @user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                        postscounter: 0)
    @post = Post.create(title: 'Post Title', text: 'Post text', likes_counter: 2, comments_counter: 3, author: @user)
    @post2 = Post.create(title: 'Post Title', text: 'Post text', likes_counter: 2, comments_counter: 3, author: @user)
    @post3 = Post.create(title: 'Post Title', text: 'Post text', likes_counter: 2, comments_counter: 3, author: @user)
  end

  it 'name should be present' do
    @user.name = nil
    expect(@user).not_to be_valid
  end

  it 'name should be string' do
    @user.name = 1
    expect(@user).not_to be_valid
  end

  it 'photo should be string' do
    @user.photo = 1
    expect(@user).not_to be_valid
  end

  it 'posts_counter should be greater than or equal to 0' do
    @user.postscounter = -1
    expect(@user).not_to be_valid
  end

  it 'user recent_methods should return 3 objects' do
    array = @user.recent_posts
    expect(array.length).to eq(3)
  end
end
