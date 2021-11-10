class AddFormatToOwnedBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :owned_books, :format, :integer
  end
end
