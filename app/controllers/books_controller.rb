class BooksController < ApplicationController

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def show
    @user=User.find(params[:id])
  end

  def create
    @book = Book.new(book_params)
    @book.save
    @books = Book.all
    redirect_to books_path
  end

  def destroy
  end

  def update
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end


end
