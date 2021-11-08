class Book < ApplicationRecord
  has_many :author_books, dependent: :destroy
  has_many :authors, through: :author_books
end
