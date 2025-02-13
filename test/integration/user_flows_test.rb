require 'test_helper'

class UserFlowsTest < ActionDispatch::IntegrationTest
  test 'full borrowing cycle' do
    # Register
    get signup_path
    assert_response :success
    
    post signup_path, params: {
      user: {
        email: 'new@user.com',
        password: 'password',
        password_confirmation: 'password'
      }
    }
    assert_redirected_to user_path(User.last)
    
    # Login
    post login_path, params: {
      email: 'new@user.com',
      password: 'password'
    }
    assert_redirected_to root_path
    
    # Borrow book
    book = Book.create!(title: 'Test Book', author: 'Author', isbn: '1234567890')
    post borrowings_path, params: { book_id: book.id }
    assert_redirected_to book_path(book)
    
    # Return book
    borrowing = Borrowing.last
    patch borrowing_path(borrowing)
    assert_redirected_to user_path(User.last)
    assert_not_nil borrowing.reload.returned_at
  end
end