class BooksController < ApplicationController


  def index
    @books = Book.all
    @user = current_user
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @user=@book.user
    @book_new = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
    redirect_to book_path(@book.id)
    flash[:notice] = "You have created book successfully."
    else
     @user = current_user
     @books = Book.all
     render("books/index")
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    redirect_to book_path(@book.id)
    flash[:notice] = "You have updated book successfully."
    else
     render("books/edit")
    end
  end

  def edit
    @book = Book.find(params[:id])
    redirect_to books_path unless current_user.id == @book.user_id
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end


end

