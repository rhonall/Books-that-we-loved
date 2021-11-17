class Book < ApplicationRecord
  resourcify
  has_many :author_books, dependent: :destroy
  has_many :authors, through: :author_books

  has_many :book_genres, dependent: :destroy
  has_many :genres, through: :book_genres

  has_many :owned_books
  has_many :users, through: :owned_books, source: :user

end
