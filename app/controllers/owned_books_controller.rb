class OwnedBooksController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :get_params_title, only: %i[new]
  before_action :get_owned_book, only: %i[show edit update destroy]


  def index
    @books = current_user.owned_books.status_available
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

  def edit
    @title = @owned_book.book.title
  end

  def update
    @owned_book.update(book_params)
    @owned_book.save
    redirect_to owned_book_path(@owned_book.id)
    flash[:notice] = "Book has updated successfully!"
  end

  def destroy
    @owned_book.update(status: 1)
    flash[:notice] = "Your book has deleted successfully!"
    redirect_to book_path(@owned_book.book.id)
  end

  private 
  
  def get_params_title
    @title = params[:title]
  end

  def get_owned_book
    @owned_book = OwnedBook.find(params[:id])
  end

  def book_params
    params.require(:owned_book).permit(:condition, :format, :owner_note, :image)
  end
end
