class RequestsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :get_request, only: [:show, :edit, :update, :destroy, :action, :accept, :decline]
  before_action :get_requestee_book, only: [:new]
  before_action :get_current_user_owned_books, only: [:new, :edit]
  before_action :get_current_user_requests_made, only: [:index]
  before_action :get_current_user_requests_of, only: [:index]
  before_action :get_all_requests_of_current_user, only: [:index]

  def index
  end
  
  def show; end

  def new
    @request = Request.new
  end

  def create
    if !params[:request].key? (:requester_book_id)
      redirect_to owned_book_path(params[:request][:requestee_book_id])
      flash[:notice] = "Sorry, you have no book to exchange."
    else
      @request = Request.new(request_params)
      @request.save
      redirect_to owned_book_path(params[:request][:requestee_book_id])
      flash[:notice] = "Request has sent to #{@request.requestee.username} successfully!"
    end
  end

  def edit
    @book = @request.requestee_book
  end

  def update
    @request.update!(request_params)
    redirect_to request_path(@request.id)
    flash[:notice] = "Request has been updated successfully!"
  end

  def destroy
    @request.update(status: 3)
    redirect_to requests_path
    flash[:notice] = "Request has been deleted successfully!"
  end

  def action
  end

  def accept
    @request.update(status: 1)
    get_requests_that_have_requester_and_requestee_books()
    @invalid_requests.each do |request|
      request.update(status: 4)
    end
    @request.requester_book.destroy
    @request.requestee_book.destroy
  end

  def decline
    @request.update(status: 2)
  end

  private

  def get_request
    @request = Request.find(params[:id])
  end

  def get_current_user_requests_made
    @requests_made = current_user.requests_made.select(:id)
  end

  def get_current_user_requests_of
    @requests_received = current_user.requests_of.select(:id)
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

  def get_all_requests_of_current_user
    @all_requests = Request.where(requester_id: current_user.id).or(Request.where(requestee_id: current_user.id))
  end

  def get_requests_that_have_requester_and_requestee_books
    @invalid_requests = Request.status_active.where(requester_book: @request.requester_book).or(Request.status_active.where(requestee_book: @request.requestee_book))
  end


end
