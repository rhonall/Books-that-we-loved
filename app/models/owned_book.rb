class OwnedBook < ApplicationRecord
  belongs_to :book
  belongs_to :user

  has_many :book_offered, class_name: "Request", foreign_key: :requester_book_id, dependent: :destroy
  has_many :book_requested, class_name: "Request", foreign_key: :requestee_book_id

  has_one_attached :image, dependent: :purge

  enum condition: {
    new: 0,
    'like-new': 1,
    good: 2,
    'well-read': 3,
  }, _prefix: true

  enum format: {
    paperback: 0,
    hardcover: 1
  }, _prefix: true
end
