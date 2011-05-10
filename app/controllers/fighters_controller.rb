class FightersController < ApplicationController

  FIGHTERS_PER_PAGE = 10
  
  def index
    @fighters = Fighter.paginate(:page => params[:page], :include => :user, :per_page => FIGHTERS_PER_PAGE)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => Fighter.all }
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
    if current_user
      if current_user.is_admin?
        redirect_to :controller => "admin/fighters", :action => "new"
      elsif current_user.is_member?
        redirect_to :controller => "members/fighters", :action => "new"
      end
    else
      redirect_to :controller => "user_sessions", :action => "new"
    end
  end
end
