class Genre < ApplicationRecord
  has_many :book_genres, dependent: :destroy
  has_many :books, through: :book_genres

  has_many :fav_genres
  has_many :users, through: :fav_genres, source: :user
end
