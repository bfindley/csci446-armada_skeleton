class Admin::FightersController < Admin::AdminController

  FIGHTERS_PER_PAGE = 10
  
  before_filter :get_users, :only => [:new, :create, :edit, :update]
  before_filter :find_fighter, :only => [:edit, :update, :destroy]
  
  def index
    @fighters = Fighter.paginate(
      :page => params[:page],
      :include => :user,
      :order => "created_at DESC",
      :per_page => FIGHTERS_PER_PAGE)
    @favorites = Favorite.get_favorites_hash(current_user)
    
    respond_to do |format|
      format.html 
      format.xml  { render :xml => Fighter.all }
    end
  end

  def show
    @fighter = Fighter.find(params[:id])

    respond_to do |format|
      format.html 
      format.xml  { render :xml => @fighter }
    end
  end

  def new
    @fighter = Fighter.new
  end

  def create
    @fighter = Fighter.new(params[:fighter])

    respond_to do |format|
      if @fighter.save
        flash[:success] = "#{@fighter.name} was successfully created."
        format.html { redirect_to admin_fighters_url }
        format.xml  { render :xml => @fighter, :status => :created, :location => @fighter }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @fighter.errors, :status => :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @fighter.update_attributes(params[:fighter])
        flash[:success] = "#{@fighter.name} was successfully updated."
        format.html { redirect_to admin_fighters_url }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @fighter.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @fighter.destroy

    respond_to do |format|
      flash[:success] = "#{@fighter.name} was successfully deleted."
      format.html { redirect_to admin_fighters_url }
      format.xml  { head :ok }
    end
  end
  
  def favorites
    @favorite = Favorite.find(:first, :conditions => {:user_id => current_user.id, :fighter_id => params[:id]})
    if @favorite.nil?
      @favorite = Favorite.new( {:user_id => current_user.id, :fighter_id => params[:id]} ) 
      if @favorite.save
        flash[:success] = "Favorite added."
        redirect_to :back
      end
    else
      @favorite.destroy
      flash[:success] = "Favorite removed."
      redirect_to :back
    end
  end
  
  private
    
    def get_users
      @users = User.all
    end
    
    def find_fighter
      @fighter = Fighter.find(params[:id])
    end
end
