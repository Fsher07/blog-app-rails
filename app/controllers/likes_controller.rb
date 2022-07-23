class LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def create
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @like = Like.new
    @like.author_id = @user.id
    @like.post_id = @post.id

    respond_to do |format|
      if @like.save
        format.html { redirect_to user_post_url(@user, @post), notice: 'Like was created successfully.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end
end
