class UsersController < ApplicationController
  before_action :authenticate_user!
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    user.save
    redirect_to book_params_path
  end

  def index
    @users = User.all
    @user = current_user
  end

  def show
    @user = current_user
  end

  def edit
    @user = User.find(params[:id])
  end
  def update
    user =User.find(params[:id])
    user.update(user_params)
    redirect_to book_path(@book.id)
  end

  def destroy
  end

  private
  def user_params
    params.require(:book).permit(:title, :body, :profile_image)
  end
end
