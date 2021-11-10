class User < ApplicationRecord
  after_commit :assign_default_role, on: :create

  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def assign_default_role
    add_role(:user) if roles.blank?
  end
end
