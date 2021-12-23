class BooksController < ApplicationController
  before_action :authenticate_user!
  def new
    @book = Book.new
  end

  def create
    book = Book.new(book_params)
    book.user_id = current_user.id
    book.save
    redirect_to book_path(book.id)
  end

  def index
    @book =Book.new
    @books = Book.all
    @user = current_user
  end

  def show
    @book_new =Book.new
    @book = Book.find(params[:id])
    @user =@book.user
  end

  def edit
     @book = Book.find(params[:id])
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
