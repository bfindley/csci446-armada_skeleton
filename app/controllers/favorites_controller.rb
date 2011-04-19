class FavoritesController < ApplicationController

  def create
    @favorites = Favorites.new(params[:favorites])
    flash[:notice] = "Created favorite"
    respond_to do |format|
      format.html { members_fighters_path }
      format.js
    end
  end

  def destroy
    @favorites = Favorites.find(params[:id])
    @favorites.destroy
    flash[:notice] = "Successfully destroyed favorites."
  end
end
