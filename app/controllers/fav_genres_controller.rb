class FavGenresController < ApplicationController
  before_action :authenticate_user!
  before_action -> { check_auth(FavGenre) }
  before_action :get_genres, only: [:new, :edit]
  before_action :get_fav_genres, only: [:index, :edit]

  def index
  end
  
  def new
  end

  def create
    @genres = params[:genres_id]
    @genres.each do |genre|
      if !genre.empty?
        current_user.fav_genres.create(genre: Genre.find(genre))
      end
    end
    redirect_to books_path
    flash[:notice] = "Thank you! You favourite genres have been added!"
  end

  def edit
    @fav_genre = current_user.fav_genres
  end
  
  def update
      @genres = params[:genres_id]
      current_user.fav_genres.destroy_all
      state = true
      @genres.each do |genre|
        if !genre.empty?
          current_user.fav_genres.create(genre: Genre.find(genre))
          state = true
        else
          state = false
        end
      end
      if state == true
        redirect_to users_path
        flash[:notice] = "Thank you! You favourite genres have been updated!"
      else 
        redirect_to edit_fav_genre_path
        flash[:alert] = "Please select at least one genre!"
      end
  end

  private

  def get_genres
    @genres = Genre.select(:id, :name).order(:name)
  end

  def get_fav_genres
    @fav_genres = current_user.fav_genres.select(:genre_id)
  end 

end
