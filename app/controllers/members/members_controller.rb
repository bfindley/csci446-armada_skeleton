class Members::MembersController < ApplicationController
  before_filter :require_user

  filter_access_to :all

  
  def index
    @fighters = Fighter.all

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
    @fighter = Fighter.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @fighter }
    end
  end


  # TODO: Add response for XML update
  def edit
    @fighter = Fighter.find(params[:id])
  end


  def create
    @fighter = Fighter.new(params[:fighter])

    respond_to do |format|
      if @fighter.save
        format.html { redirect_to(@fighter, :notice => 'Fighter was successfully created.') }
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
        format.html { redirect_to(@fighter, :notice => 'Fighter was successfully updated.') }
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
      format.html { redirect_to(fighters_url) }
      format.xml  { head :ok }
    end
  end
  
  protected

    def permission_denied
      flash[:error] = "You do not have access to #{request.path}."
      respond_to do |format|
        format.html { redirect_to members_root_url }
        format.xml { head :unauthorized }
        format.js { head :unauthorized }
      end
    end
  
end
