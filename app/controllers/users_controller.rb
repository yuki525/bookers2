class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @users = User.all
    @books = Book.new

  end

  def show
    @user= User.find(params[:id])

    @books1 = @user.books
    @books = Book.new

  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render  :edit
    else
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'You have updated user successfully.'
    else
      render :edit
    end
  end


end

private
def user_params
  params.require(:user).permit(:name, :profile_image, :introduction)
end