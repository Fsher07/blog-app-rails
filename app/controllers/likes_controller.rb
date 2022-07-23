class LikesController < ApplicationController
  def new
    @like = Like.new
    @user = current_user
  end

  def create
    @post = Post.find(params[:post_id])
    @like = Like.new
    @like.author_id = current_user.id
    @like.post_id = @post.id

    respond_to do |format|
      if @like.save
        format.html { redirect_to user_post_url(current_user, @post), notice: 'Like was created successfully.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end
end
