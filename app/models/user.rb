class User < ApplicationRecord
  after_commit :assign_default_role, on: :create

  has_many :owned_books
  has_many :books, through: :owned_books, source: :book

  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def assign_default_role
    add_role(:user) if roles.blank?
  end
end
