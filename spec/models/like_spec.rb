require 'rails_helper'

RSpec.describe Like, type: :model do
  before(:all) do
    @user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')

    @post = Post.new(title: 'Post Title', text: 'Post text', likes_counter: 0, comments_counter: 0, author: @user)
  end

  it 'should return likes_counter incremented by 1' do
    @post.save
    @like = Like.new(author: @user, post: @post)
    @like.save
    expect(@post.likes_counter).to eq(1)
  end
end
