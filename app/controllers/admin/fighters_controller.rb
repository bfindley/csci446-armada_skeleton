class Admin::FightersController < Admin::AdminController
  
  
  FIGHTERS_PER_PAGE = 20
  
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

  def edit
    @fighter = Fighter.find(params[:id])
  end

  def create
    @fighter = Fighter.new(params[:fighter])

    respond_to do |format|
      if @fighter.save
        flash[:success] = '#{@fighter.name} was successfully created.'
        format.html { redirect_to admin_fighters_url }
        format.xml  { render :xml => @fighter, :status => :created, :location => @fighter }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @fighter.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @fighter = Fighter.find(params[:id])

    respond_to do |format|
      if @fighter.update_attributes(params[:fighter])
        format.html { redirect_to admin_fighters_url }
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
      format.html { redirect_to admin_fighters_url }
      format.xml  { head :ok }
    end
  end
end
