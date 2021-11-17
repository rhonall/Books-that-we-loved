class BooksController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action -> { check_auth(Book) }, only: [:new, :create, :edit, :update, :destroy]
  before_action :get_params, only: [:new]
  before_action :get_genres, only: [:new, :create]
  before_action :get_book, only: [:show]

  def index
    @books = Book.select(:title, :id, :cover)
  end

  def show
  end

  def new
    book = Book.find_by(book_api_id: params[:book_api_id])
    if !book.nil?
      redirect_to book_path(book)
      flash[:notice] = "Book is already in library."
    else
      @book = Book.new
    end
  end

  def create
    if Book.find_by(book_api_id: params[:book][:book_api_id]).nil?
      @book = Book.new(book_params)
      puts params[:book][:authors]
      @authors_array = params[:book][:authors].split(', ')
      @authors_array.each do |author|
        if Author.find_by(name: author).nil?
          Author.create(name: author)
        end
        @book.authors << Author.find_by(name: author)
      end
      @book.save!
    end
    redirect_to new_owned_book_path(title: "#{@book.title}")
    flash[:notice] = "Book is added to library, please continue to add your book for swap"
  end

  def edit
  end

  def update
  end

  def destroy
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

  private

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
