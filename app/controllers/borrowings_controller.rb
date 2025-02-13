class BorrowingsController < ApplicationController
  before_action :authenticate_user!

  def create
    @book = Book.find(params[:book_id])
    @borrowing = current_user.borrowings.new(book: @book)

    if @borrowing.save
      redirect_to @book, notice: 'Book borrowed successfully.'
    else
      redirect_to @book, alert: @borrowing.errors.full_messages.to_sentence
    end
  end

  def update
    @borrowing = current_user.borrowings.active.find(params[:id])
    if @borrowing.update(returned_at: Time.current)
      redirect_to user_path(current_user), notice: 'Book returned successfully.'
    else
      redirect_to user_path(current_user), alert: 'Failed to return book.'
    end
  end
end