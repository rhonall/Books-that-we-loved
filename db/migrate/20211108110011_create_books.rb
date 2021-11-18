class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.text :description
      t.string :book_api_id, null: false

      t.timestamps
    end
  end
end
