class BookCommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @user = @book.user
    @books = Book.new
    @book_comment = BookComment.new

    book = Book.find(params[:book_id])
    @comment = current_user.book_comment.new(book_params)
    @comment.book_id = book.id

    if @comment.save
    redirect_to book_path(book)
    else

      render "books/show"
    end
  end

  def destroy
    BookComment.find_by(id: params[:id], book_id: params[:book_id]).destroy
    redirect_to book_path(params[:book_id])
  end

  private

  def book_params
    params.require(:book_comment).permit(:comment)
  end

end
