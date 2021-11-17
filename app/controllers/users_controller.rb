class UsersController < ApplicationController
  def show
    @user = User.new
    @users = User.all
    @user = User.find(params[:id])
  end

  def index
    @user = User.new
    @users = User.all
  end

  def create
    user = User.new(user_params)
    user.save
    redirect_to book_path
  end

  def update
    @user = User.find(params[:id])
    redirect_to user_path(@user.id)
  end

  def edit
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:title, :opinion, :profile_image)
  end
end
