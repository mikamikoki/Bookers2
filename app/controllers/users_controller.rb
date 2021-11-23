class UsersController < ApplicationController


  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def index
    @book = Book.new
    @users = User.all
    @user = current_user
  end

  def create
    @book = Book.new(book_params)
    @book.user=current_user
    @book.save
    redirect_to book_path(@book.id)
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(@user.id)
    flash[:notice] = "You have updated user successfully."
    else
     render("users/edit")
    end
  end

  def edit
    @user = User.find(params[:id])
    # if @user = current_user
    #   render ("users/edit")
    # else
    #   redirect_to books_path
    # end
      redirect_to user_path(current_user) unless current_user.id == @user.id
  end

  private
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
