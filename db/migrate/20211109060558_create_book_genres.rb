class CreateBookGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :book_genres do |t|
      t.references :book, null: false, foreign_key: true
      t.references :genre, null: false, foreign_key: true

      t.timestamps
    end
  end
end
