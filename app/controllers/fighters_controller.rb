class FightersController < ApplicationController

  FIGHTERS_PER_PAGE = 10
  
  def index
    @fighters = Fighter.paginate(:page => params[:page], :include => :user, :per_page => FIGHTERS_PER_PAGE)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @fighters }
    end
  end

  def show
    @fighter = Fighter.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @fighter }
    end
  end
  
  def new
    if user
      redirect_to :controller => "members", :action => "new"
    else
      redirect_to :controller => "users", :action => "new"
    end
  end
end
