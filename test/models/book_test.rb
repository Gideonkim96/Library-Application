require 'test_helper'

class BookTest < ActiveSupport::TestCase
  test 'valid book' do
    book = Book.new(title: 'Test Book', author: 'Author', isbn: '1234567890')
    assert book.valid?
  end

  test 'invalid without title' do
    book = Book.new(author: 'Author', isbn: '1234567890')
    refute book.valid?
  end

  test 'isbn must be unique' do
    Book.create!(title: 'Book 1', author: 'Author', isbn: '1234567890')
    book = Book.new(title: 'Book 2', author: 'Author', isbn: '1234567890')
    refute book.valid?
  end
end