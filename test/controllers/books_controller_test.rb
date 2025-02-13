require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get books_path
    assert_response :success
    assert_select 'h1', 'Books'
  end

  test 'should show book' do
    book = Book.create!(title: 'Test Book', author: 'Author', isbn: '1234567890')
    get book_path(book)
    assert_response :success
    assert_select 'h1', book.title
  end
end