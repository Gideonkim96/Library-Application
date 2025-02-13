require 'test_helper'

class BorrowingTest < ActiveSupport::TestCase
  setup do
    @user = User.create!(email: 'user@example.com', password: 'password')
    @book = Book.create!(title: 'Test Book', author: 'Author', isbn: '1234567890')
  end

  test 'sets due date on creation' do
    borrowing = Borrowing.create!(user: @user, book: @book)
    assert_equal borrowing.due_date.to_date, (Time.current + 2.weeks).to_date
  end

  test 'prevents duplicate active borrowings' do
    Borrowing.create!(user: @user, book: @book)
    borrowing2 = Borrowing.new(user: @user, book: @book)
    refute borrowing2.valid?
    assert_includes borrowing2.errors[:book], 'is already borrowed'
  end

  test 'allows multiple borrowings after return' do
    borrowing = Borrowing.create!(user: @user, book: @book)
    borrowing.update!(returned_at: Time.current)
    borrowing2 = Borrowing.create!(user: @user, book: @book)
    assert borrowing2.valid?
  end
end