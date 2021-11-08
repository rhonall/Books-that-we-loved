class AddIsbnToBooks < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :isbn, :bigint
  end
end
