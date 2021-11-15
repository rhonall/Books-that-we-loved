class RequestsController < ApplicationController
  before_action :get_request, only: [:show]
  before_action :get_requestee_book, only: [:new]
  before_action :get_current_user_owned_books, only: [:new]
  before_action :get_current_user_requests_made, only: [:index]

  def index
  end
  
  def show; end

  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    @request.save
    
    redirect_to requests_path
  end

  private

  def get_request
    @request = Request.find(params[:id])
  end

  def get_current_user_requests_made
    @requests = current_user.requests_made
  end

  def get_requestee_book
    @book = OwnedBook.find(params[:requestee_book_id])
  end

  def get_current_user_owned_books
    @owned_books = current_user.owned_books
  end

  def request_params
    params.require(:request).permit(:requestee_id, :requester_id, :requestee_book_id, :requester_book_id)
  end
end
