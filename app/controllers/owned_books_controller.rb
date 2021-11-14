class OwnedBooksController < ApplicationController
  before_action :get_params_title, only: %i[new]
  before_action :book_params, only: %i[create]
  before_action :get_params, only: %i[show]


  def index
    @books = current_user.owned_books
    @requests = Request.select(:id)
  end

  def show
  end

  def new
    @owned_book = OwnedBook.new
  end
  
  def create
    book_id = Book.find_by(title: params[:owned_book][:title]).id
    @new_owned_book = current_user.owned_books.new(book_params)
    @new_owned_book.update(book_id: book_id)
    @new_owned_book.save
    redirect_to owned_book_path(@new_owned_book)
    flash[:notice] = "Book is added successfully!"
  end

  def get_params_title
    @title = params[:title]
  end

  def get_params
    @book = OwnedBook.find(params[:id])
  end

  def book_params
    params.require(:owned_book).permit(:condition, :format, :owner_note, :image)
  end
end
