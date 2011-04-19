class Members::FightersController < Members::MembersController

  before_filter :get_users, :only => [:new, :create, :edit, :update]

  FIGHTERS_PER_PAGE = 10
  
  def index
    @fighters = Fighter.paginate(:page => params[:page], :include => :user, :per_page => FIGHTERS_PER_PAGE)

    respond_to do |format|
      format.html 
      format.xml  { render :xml => @fighters }
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

    respond_to do |format|
      format.html 
      format.xml  { render :xml => @fighter }
    end
  end

  def create
    @fighter = Fighter.new(params[:fighter])
    @fighter.user = @current_user
    respond_to do |format|
      if @fighter.save
        flash[:success] = "#{@fighter.name} was successfully created."
        format.html { redirect_to members_fighters_url }
        format.xml  { render :xml => @fighter, :status => :created, :location => @fighter }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @fighter.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def edit
    @fighter = Fighter.find(params[:id])
  end

  def update
    @fighter = Fighter.find(params[:id])

    respond_to do |format|
      if @fighter.update_attributes(params[:fighter])

        flash[:success] = "#{@fighter.name} was successfully updated."
        format.html { redirect_to members_fighters_url }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @fighter.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @fighter = Fighter.find(params[:id])
    @fighter.destroy

    respond_to do |format|
      flash[:success] = "#{@fighter.name} was successfully deleted."
      format.html { redirect_to members_fighters_url }
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
end
