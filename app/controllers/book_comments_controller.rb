class BookCommentsController < ApplicationController
  def create
    @book = Book.find(params[:book_id])
    comment = BookComment.new(book_comments_params)
    comment.user_id = current_user.id
    comment.book_id = @book.id
    comment.save
  end

  def destroy
    @book = Book.find(params[:book_id])
    comment = BookComment.find_by(book_id: @book.id, id: params[:id])
    comment.user_id = current_user.id
    comment.book_id = @book.id
    comment.destroy
    
  end

  private
  def book_comments_params
    params.require(:book_comment).permit(:comment)
  end

end
