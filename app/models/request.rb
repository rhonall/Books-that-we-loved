class Request < ApplicationRecord
  belongs_to :requester, class_name: "User"
  belongs_to :requestee, class_name: "User"
  belongs_to :requester_book, class_name: "OwnedBook"
  belongs_to :requestee_book, class_name: "OwnedBook"

  scope :status_active, -> { where(status: 0) }
  scope :status_completed, -> { where.not(status: 0) }


  enum status: {
    pending: 0,
    cofirmed: 1,
    declined: 2,
    cancelled: 3,
    invalid: 4
  }, _prefix: true
end
