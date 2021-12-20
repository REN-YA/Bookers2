class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    book = Book.new(book_params)
    book.save
    redirect_to book_show
  end

  def index
  end

  def show
  end

  def destroy
  end

  private

  def book_params
    params.requrire(:book).permit(:titel, :body)
  end
end
