class BooksController < ApplicationController
  before_action :get_params, only: [:new]

  def index
    @books = Book.select(:title, :id)
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def create
    if Book.find_by(title: params[:book][:title]).nil?
      @book = Book.new(book_params)
      @authors_array = params[:book][:authors].split(', ')
      @authors_array.each do |author|
        if Author.find_by(name: author).nil?
          Author.create(name: author)
          @book.authors << Author.find_by(name: author)
        else
          @book.authors << Author.find_by(name: author)
        end
      end
      @book.save!
    end 
    redirect_to books_path
  end

  def search
  end
  
  def search_results
    @books = GoogleBooks.search("intitle:#{params[:search]}")
  end

  def book_params
    params.require(:book).permit(:title, :description, :book_api_id, :cover)
  end

  def get_authors
    @authors = Author.select(:name)
  end

  def get_params
    @title = params[:title]
    @authors = params[:authors]
    @description = params[:description]
    @book_api_id = params[:book_api_id]
    @cover = params[:cover]
  end
end
