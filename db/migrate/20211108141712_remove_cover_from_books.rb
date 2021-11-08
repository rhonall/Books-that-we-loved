class RemoveCoverFromBooks < ActiveRecord::Migration[6.1]
  def change
    remove_column :books, :cover, :string
  end
end
