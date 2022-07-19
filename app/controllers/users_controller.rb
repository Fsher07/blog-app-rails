class UsersController < ActionController::Base
  def index
    @users = User.all
  end

  def show
    @users = User.find(params[:id])
  end
end
