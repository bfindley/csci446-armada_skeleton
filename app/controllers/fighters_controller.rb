class FightersController < ApplicationController

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

end
