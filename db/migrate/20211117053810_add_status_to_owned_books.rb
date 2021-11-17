class AddStatusToOwnedBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :owned_books, :status, :integer, default: 0
  end
end
