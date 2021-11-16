class UsersController < ApplicationController
  before_action :get_genres, only: [:fav]
  
  def fav
  end

  def add_fav_genres
    @genres = params[:genres_id]
    @genres.each do |genre|
      if !genre.empty?
        current_user.fav_genres.create(genre: Genre.find(genre))
      end
    end
  end

  private

  def get_genres
    @genres = Genre.order(:name)
  end

end
