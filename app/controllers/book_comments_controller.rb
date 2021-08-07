class BookCommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    @user = @book.user
    @books = Book.new
    @book_comment = BookComment.new


    @comment = current_user.book_comment.new(book_params)
    @comment.book_id = @book.id

    if @comment.save

    else

      # render "books/show"
    end
  end

  def destroy
    @book_comment = BookComment.new
    @book = Book.find(params[:book_id])
    BookComment.find_by(id: params[:id], book_id: params[:book_id]).destroy

  end

  private

  def book_params
    params.require(:book_comment).permit(:comment)
  end

end
