class RemoveIsbnFromBooks < ActiveRecord::Migration[6.1]
  def change
    remove_column :books, :isbn, :bigint
  end
end
