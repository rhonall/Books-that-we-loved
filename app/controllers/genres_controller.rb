class GenresController < ApplicationController
  before_action :get_genres, only: [:index, :fav]
  before_action :get_genre, only: [:show]
  def index
  end

  def show
  end

  def fav
  end

  private

  def get_genres
    @genres = Genre.order(:name)
  end

  def get_genre
    @genre = Genre.find(params[:id])
  end
end
