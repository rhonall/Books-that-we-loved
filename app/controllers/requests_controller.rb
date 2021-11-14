class RequestsController < ApplicationController
  before_action :get_request, only: [:show]
  before_action :get_requestee_book, only: [:new]
  before_action :get_current_user_owned_books, only: [:new]
  
  def show
  end

  def new
    test()
    @request = Request.new()
  end

  def get_request
    @request = Request.find(params[:id])
  end

  def get_requestee_book
    @book = OwnedBook.find(params[:requestee_book_id])
  end

  def get_current_user_owned_books
    @owned_books = current_user.owned_books.all
  end
  
  def test
    @owned_books = current_user.owned_books.all
    @test = @owned_books.map { |b| b.book.title }
  end
end
