class OwnedBooksController < ApplicationController
  before_action :get_params_title, only: %i[new]
  before_action :book_params, only: %i[create]
  before_action :get_params, only: %i[show]


  def index
    @books = current_user.owned_books
  end

  def show
  end

  def new
    @owned_book = OwnedBook.new
  end
  
  def create
  end

  def get_params_title
    @title = params[:title]
  end

  def get_params
    @book = OwnedBook.find(params[:id])
  end

  def book_params
  end
end
