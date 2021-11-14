class Request < ApplicationRecord
  belongs_to :requester, class_name: "User"
  belongs_to :requestee, class_name: "User"
  belongs_to :requester_book, class_name: "OwnedBook"
  belongs_to :requestee_book, class_name: "OwnedBook"
end
