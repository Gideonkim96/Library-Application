require 'test_helper'

class BooksIndexTest < ActionDispatch::IntegrationTest
  test 'displays all books' do
    Book.create!(title: 'Book 1', author: 'Author', isbn: '1234567890')
    Book.create!(title: 'Book 2', author: 'Author', isbn: '0987654321')
    
    get books_path
    assert_select 'div', count: 2
    assert_select 'h2', 'Book 1'
    assert_select 'h2', 'Book 2'
  end
end