class AddConditionToOwnedBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :owned_books, :condition, :integer, null: false
  end
end
