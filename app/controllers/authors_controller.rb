class AuthorsController < ApplicationController
  before_action :get_authors, only: [:index]
  before_action :get_author, only: [:show, :destroy]
  def index
  end

  def show
  end

  def destroy
    @author.destroy
    redirect_to admins_path
    flash[:notice] = "Author has deleted successfully!"
  end

  private

  def get_authors
    @authors = Author.select(:id, :name).order(:name)
  end

  def get_author
    @author = Author.find(params[:id])
  end

end
