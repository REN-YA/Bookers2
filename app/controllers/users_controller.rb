class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    user.save
    redirect_to book_params_path
  end

  def raindex
    @users = User.all
  end

  def show
    @user = User.find (params_id)
  end
  
  def edit
    @book = Book.find(params_id)
  end

  def destroy
  end
  
  private
  def book_params
    params.require(:book).permit(:title, :body, :image)
  end
end
