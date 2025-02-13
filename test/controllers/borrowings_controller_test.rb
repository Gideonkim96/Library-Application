require 'test_helper'

class BorrowingsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = User.create!(email: 'user@example.com', password: 'password')
    @book = Book.create!(title: 'Test Book', author: 'Author', isbn: '1234567890')
  end

  test 'should create borrowing' do
    sign_in @user
    assert_difference('Borrowing.count') do
      post borrowings_path, params: { book_id: @book.id }
    end
    assert_redirected_to book_path(@book)
  end

  test 'should return book' do
    sign_in @user
    borrowing = Borrowing.create!(user: @user, book: @book)
    patch borrowing_path(borrowing)
    assert_redirected_to user_path(@user)
    assert_not_nil borrowing.reload.returned_at
  end
end