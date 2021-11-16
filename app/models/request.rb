class Request < ApplicationRecord
  belongs_to :requester, class_name: "User"
  belongs_to :requestee, class_name: "User"
  belongs_to :requester_book, class_name: "OwnedBook"
  belongs_to :requestee_book, class_name: "OwnedBook"

  enum status: {
    pending: 0,
    cofirmed: 1,
    declined: 2
  }, _prefix: true
end
