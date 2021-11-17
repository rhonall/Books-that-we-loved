class AdminsController < ApplicationController
  def index
    get_all_owned_books()
  end

  private 
  def get_all_owned_books
    @owned_books = OwnedBook.select(:id, :book_id)
  end
end
