class GenresController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action -> { check_auth(Genre) }
  before_action :get_genres, only: [:index]
  before_action :get_genre, only: [:show]
  def index
  end

  def show
  end

  private

  def get_genres
    @genres = Genre.select(:id, :name).order(:name)
  end

  def get_genre
    @genre = Genre.find(params[:id])
  end
end
