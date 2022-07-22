RSpec.describe Post, type: :model do
  before(:all) do
    @user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                        postscounter: 0)
    @user2 = User.create(name: 'Alex', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                         postscounter: 0)

    @post = Post.create(title: 'Post Title', text: 'Post text', likes_counter: 2, comments_counter: 3, author: @user)

    @post1 = Post.create(title: 'Post Title', text: 'Post text', likes_counter: 0, comments_counter: 0, author: @user2)

    @comment1 = Comment.create(text: 'Comment text1', author: @user2, post: @post1)
    @comment2 = Comment.create(text: 'Comment text2', author: @user2, post: @post1)
    @comment3 = Comment.create(text: 'Comment text3', author: @user2, post: @post1)
    @comment4 = Comment.create(text: 'Comment text4', author: @user2, post: @post1)
    @comment5 = Comment.create(text: 'Comment text5', author: @user2, post: @post1)
  end

  it 'title should be present and not empty' do
    @post.title = nil
    expect(@post).not_to be_valid

    @post.title = ''
    expect(@post).to_not be_valid
  end

  it 'post update_post_counter method should increment postcounter' do
    @post.update_post_counter
    expect(@user.postscounter).to eq(2)
  end

  it 'title should be present' do
    @post.title = 'Post Title'
    expect(@post).to be_valid
  end

  it 'should return comments_counter greater than or equal to 0' do
    @post.comments_counter = -15
    expect(@post).not_to be_valid

    @post.comments_counter = 2
    expect(@post).to be_valid

    @post.comments_counter = 4
    expect(@post).to be_valid
  end

  it 'should return likes_counter greater than or equal to 0' do
    @post.likes_counter = -13
    expect(@post).to_not be_valid

    @post.likes_counter = 0
    expect(@post).to be_valid

    @post.likes_counter = 19
    expect(@post).to be_valid
  end

  it 'Post recent_comments methods should return 5 comments' do
    last = @post1.recent_comments
    expect(last.last.text).to eq('Comment text1')
  end
end
