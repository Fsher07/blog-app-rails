require 'rails_helper'

RSpec.describe User, type: :model do
  before(:all) do
    @user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                        postscounter: 0)
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
end
