class BooksController < ApplicationController
  before_action :get_params, only: [:new]
  before_action :get_genres, only: [:new, :create]
  before_action :get_book, only: [:show]

  def index
    @books = Book.select(:title, :id)
  end

  def show
  end

  def new
    @book = Book.new
  end

  def create
    if Book.find_by(book_api_id: params[:book][:book_api_id]).nil?
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

  # Search bar
  def search
    case params[:type]
    when 'author'
      @authors = Author.where("LOWER(name) LIKE LOWER(?)", "%#{params[:query]}%")
      render "authors/index"
    when 'title'
      @books = Book.where("LOWER(title) LIKE LOWER(?)", "%#{params[:query]}%")
      render 'index'
    end
  end
  # Progress to add new book
  def find; end

  def found_results
    @books = GoogleBooks.search("intitle:#{params[:find]}")
  end

  def book_params
    params.require(:book).permit(:title, :description, :book_api_id, :cover, genre_ids: [])
  end

  def get_genres
    @genres = Genre.all
  end

  def get_params
    @title = params[:title]
    @authors = params[:authors]
    @description = params[:description]
    @book_api_id = params[:book_api_id]
    @cover = params[:cover]
  end

  def get_book
    @book = Book.find(params[:id])
  end
end
