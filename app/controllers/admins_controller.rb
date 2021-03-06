class AdminsController < ApplicationController
  before_action :authenticate_user!

  def index
    if current_user && (current_user.has_role? :admin)
      get_all_owned_books()
      get_authors()
      get_author_with_no_books()
    else
      redirect_to books_path
      flash[:alert] = "You are not authorized to perform this action."
    end
  end

  private 
  
  def get_all_owned_books
    @owned_books = OwnedBook.select(:id, :book_id)
  end

  def get_authors
    @authors = Author.select(:id, :name).order(:name)
  end

  def get_author_with_no_books
    @authors_have_no_books = []
    @authors.each do |author|
      if author.books.length == 0
        @authors_have_no_books << author
      end
    end
  end
end
