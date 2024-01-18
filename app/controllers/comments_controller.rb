class CommentsController < ApplicationController
  def index
    @comments = Comment.includes(:author_id)
  end

  def show; end

  def new
    @comment = Comment.new
  end

  def create
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id] || params[:id])
    @comment = Comment.new(comment_params)
    @comment.author_id = current_user.id
    @comment.post = @post

    respond_to do |format|
      if @comment.save
        format.html do
          redirect_to user_post_url(@user, @post), notice: 'Comment was successfully created.'
        end
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:success] = 'Your comment has been deleted successfully!'
    redirect_to user_post_url(current_user, @comment.post)
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
