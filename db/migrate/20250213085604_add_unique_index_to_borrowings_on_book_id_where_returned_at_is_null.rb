class AddUniqueIndexToBorrowingsOnBookIdWhereReturnedAtIsNull < ActiveRecord::Migration[7.0]
  def change
    unless index_exists?(:borrowings, :book_id, name: "index_borrowings_on_book_id")
      add_index :borrowings, :book_id, unique: true, where: "returned_at IS NULL", name: "index_borrowings_on_book_id"
    end
  end
end
