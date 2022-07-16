require_relative '../rails_helper'

RSpec.describe Comment, type: :model do
  before(:all) do
    @user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')

    @post = Post.create(title: 'Post Title', text: 'Post text', likes_counter: 0, comments_counter: 0, author: @user)

    @comment = Comment.create(text: 'Comment text', author: @user, post: @post)
  end

  it 'should return comments_counter incremented by 1' do
    expect(@post.comments_counter).to eq(1)
  end

  it 'should return correct author name' do
    expect(@comment.author.name).to eq('Tom')
  end
end
