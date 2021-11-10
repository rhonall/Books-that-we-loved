class OwnedBooksController < ApplicationController
  before_action :get_params, only: %i[new]
  before_action :book_params, only: %i[create]
  def index
  end

  def new
    @owned_book = OwnedBook.new
  end
  
  def create
  end

  def get_params
    @title = params[:title]
  end

  def book_params
  end
end
