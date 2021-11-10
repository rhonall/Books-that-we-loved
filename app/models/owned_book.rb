class OwnedBook < ApplicationRecord
  belongs_to :book
  belongs_to :user

  enum condition: {
    new: 0,
    'like-new': 1,
    good: 2,
    'well-read': 3
  }, _prefix: true

  enum format: {
    paperback: 0,
    hardcover: 1
  }, _prefix: true
end
