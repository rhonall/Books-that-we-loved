class User < ApplicationRecord
  after_commit :assign_default_role, on: :create

  has_many :owned_books
  has_many :books, through: :owned_books, source: :book

  has_many :fav_genres
  has_many :genres, through: :fav_genres, source: :genre

  has_many :requests_made, class_name: "Request", foreign_key: :requester_id
  has_many :requests_of, class_name: "Request", foreign_key: :requestee_id

  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def assign_default_role
    add_role(:user) if roles.blank?
  end
end
