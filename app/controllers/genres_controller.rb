class GenresController < ApplicationController
  before_action :get_genres, only: [:index]
  before_action :get_genre, only: [:show]
  def index
  end

  def show
  end

  private

  def get_genres
    @genres = Genre.order(:name)
  end

  def get_genre
    @genre = Genre.find(params[:id])
  end
end
