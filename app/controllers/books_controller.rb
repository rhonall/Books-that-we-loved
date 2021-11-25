class BooksController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search]
  before_action -> { check_auth(Book) }, except: [:search]
  before_action :get_params, only: [:new]
  before_action :get_genres, only: [:new, :create, :edit, :update]
  before_action :get_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.select(:title, :id, :cover, :status).status_valid
  end

  def show
  end

  def new
    book = Book.find_by(book_api_id: params[:book_api_id])
    if !book.nil?
      book.update(status: 0)
      redirect_to book_path(book)
      flash[:notice] = "Please click swap to add your book to this platform."
    else
      @book = Book.new
    end
  end

  def create
    begin
      if Book.find_by(book_api_id: params[:book][:book_api_id]).nil?
        @book = Book.new(book_params)
        add_or_edit_authors(@book)
        @book.save!
      end
      redirect_to new_owned_book_path(title: "#{@book.title}")
      flash[:notice] = "Book is added to library, please continue to add your book for swap"
    rescue
      get_params()
      flash.now[:errors] = @book.errors.messages.values.flatten
      render 'new'
    end
  end

  def edit
    @genres = Genre.select(:id, :name)
  end

  def update
    @book.update(book_params)
    @book.authors.destroy_all
    add_or_edit_authors(@book)
    begin
      @book.save!
      redirect_to book_path(@book.id)
      flash[:notice] = "Book has updated successfully!"
    rescue
      flash.now[:errors] = @book.errors.messages.values.flatten
      render 'edit'
    end
  end

  def destroy
    @affected_ownedbooks = OwnedBook.select(:id, :book_id, :status, :user_id).where(book_id: @book.id).status_available
    if @affected_ownedbooks.length > 0
      flash[:notice] = "Sorry, this book cannot be deleted as there is owned book linked to this book!"
      render 'show'
    else
      @book.update(status: 1)
      flash[:notice] = "Book has been destroyed successfully!"
      redirect_to books_path
    end
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
    @genres = Genre.select(:id, :name)
  end

  def get_params
    @title = params[:title] || params[:book][:title]
    @authors = params[:authors] || params[:book][:authors]
    @description = params[:description] || params[:book][:description]
    @book_api_id = params[:book_api_id] || params[:book][:book_api_id]
    @cover = params[:cover] || params[:book][:cover]
  end

  def get_book
    @book = Book.find(params[:id])
  end

  def add_or_edit_authors(book)
    @authors_array = params[:book][:authors].split(', ')
    @authors_array.each do |author|
      if Author.find_by(name: author).nil?
        Author.create(name: author)
      end
      book.authors << Author.find_by(name: author)
    end
  end
end
