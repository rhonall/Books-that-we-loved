class CreateOwnedBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :owned_books do |t|
      t.references :book, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
