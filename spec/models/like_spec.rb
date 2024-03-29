require 'rails_helper'

RSpec.describe Like, type: :model do
  before(:all) do
    @user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                        postscounter: 0)

    @post = Post.create(title: 'Post Title', text: 'Post text', likes_counter: 0, comments_counter: 0, author: @user)
  end

  it 'should return likes_counter incremented by 1' do
    @like = Like.create(author: @user, post: @post)
    @like.update_like_counter
    expect(@post.likes_counter).to eq(2)
  end
end
