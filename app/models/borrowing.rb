class Borrowing < ApplicationRecord
  belongs_to :user
  belongs_to :book

  before_create :set_due_date
  validate :book_is_available, on: :create

  scope :active, -> { where(returned_at: nil) }

  private

  def set_due_date
    self.due_date = Time.current + 2.weeks
  end

  def book_is_available
    errors.add(:book, 'is already borrowed') if book&.borrowings&.active&.exists?
  end
end