class UsersController < ApplicationController
  def show
    @user = User.new
    @users = User.all
    @user = User.find(params[:id])
    @books = Book.all
    @book = Book.new

  end

  def index
    @user = User.new
    @users = User.all
    @user = current_user
  end

  def create
    @user = User.new(user_params)
    @user.save
    @book = Book.new(book_params)
    @book.save
    redirect_to book_path(@book.id)
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def edit
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
