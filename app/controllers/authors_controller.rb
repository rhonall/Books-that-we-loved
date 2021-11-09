class AuthorsController < ApplicationController
  before_action :get_authors, only: [:index]
  before_action :get_author, only: [:show]
  def index
  end

  def show
  end

  private

  def get_authors
    @authors = Author.order(:name)
  end

  def get_author
    @author = Author.find(params[:id])
  end
end
