class AddOwnerNoteToOwnedBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :owned_books, :owner_note, :text
  end
end
