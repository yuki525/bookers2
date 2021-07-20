class BooksController < ApplicationController

  def index
    @user = current_user
    @book = Book.all
    @users = User.all
    @books = Book.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @book = Book.new
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path(@book)
  end


  def edit
  end

private

def user_params
  params.require(:user).permit(:name, :profile_image, :introduction)
end

end
