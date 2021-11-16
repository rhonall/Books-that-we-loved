class RequestsController < ApplicationController
  before_action :get_request, only: [:show, :edit, :update, :destroy, :action, :accept, :decline]
  before_action :get_requestee_book, only: [:new]
  before_action :get_current_user_owned_books, only: [:new, :edit]
  before_action :get_current_user_requests_made, only: [:index]
  before_action :get_current_user_requests_of, only: [:index]

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
    @book = @request.requester_book
  end

  def update
    @request.update(request_params)
    redirect_to request_path(@request.id)
    flash[:notice] = "Request has been updated successfully!"
  end

  def destroy
    @request.destroy
    redirect_to requests_path
    flash[:notice] = "Request has been deleted successfully!"
  end

  def action
    if params[:state] == 'accept'
      @request.update(status: 1)
    else
      @request.update(status: 2)
    end
  end

  def accept
  end

  def decline
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

end
