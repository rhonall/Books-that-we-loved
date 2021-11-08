class AddBookApiIdToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :book_api_id, :string
  end
end
