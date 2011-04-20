class Members::FavoritesController < Members::MembersController
  FIGHTERS_PER_PAGE = 10

  def index
    @favorites = Favorite.paginate(:page => params[:page], :include => [:user, :fighter],:conditions => {:user_id => current_user.id}, :per_page => FIGHTERS_PER_PAGE)
    @favorites = Favorite.get_favorites_hash(current_user)

    respond_to do |format|
      format.html 
      format.xml  { render :xml => @favorites }
    end
  end
  
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
