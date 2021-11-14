class CreateRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :requests do |t|
      t.references :requester, null: false, foreign_key: {to_table: :users}
      t.references :requestee, null: false, foreign_key: {to_table: :users}
      t.references :requester_book, null: false, foreign_key: {to_table: :owned_books}
      t.references :requestee_book, null: false, foreign_key: {to_table: :owned_books}

      t.timestamps
    end
  end
end
