class Book < ApplicationRecord
  resourcify
  has_many :author_books, dependent: :destroy
  has_many :authors, through: :author_books

  has_many :book_genres, dependent: :destroy
  has_many :genres, through: :book_genres

  has_many :owned_books
  has_many :users, through: :owned_books, source: :user

  validates :title, presence: { message: "Please provide a title" }
  validates :authors, presence: { message: "Please provide at least one author" }
  validate :must_have_one_genre

  def must_have_one_genre
    if genre_ids.length < 1
      errors.add(:genre_ids, 'Please select at least one genre')
    end
  end 

  enum status: {
    valid: 0,
    invalid: 1
  }, _prefix: true
end
