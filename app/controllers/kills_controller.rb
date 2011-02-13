class KillsController < ApplicationController
  protect_from_forgery :except => :create
  
  # GET /kills
  # GET /kills.xml
  def index
    @kills = Kill.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @kills }
    end
  end

  # GET /kills/1
  # GET /kills/1.xml
  def show
    @kill = Kill.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @kill }
    end
  end

  # GET /kills/new
  # GET /kills/new.xml
  def new
    @kill = Kill.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @kill }
    end
  end

  # GET /kills/1/edit
  def edit
    @kill = Kill.find(params[:id])
  end

  # POST /kills
  # POST /kills.xml
  def create
    @kill = Kill.new(params[:kill])

    respond_to do |format|
      if @kill.save
        format.html { redirect_to(@kill, :notice => 'Kill was successfully created.') }
        format.xml  { render :xml => @kill, :status => :created, :location => @kill }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @kill.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /kills/1
  # PUT /kills/1.xml
  def update
    @kill = Kill.find(params[:id])

    respond_to do |format|
      if @kill.update_attributes(params[:kill])
        format.html { redirect_to(@kill, :notice => 'Kill was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @kill.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /kills/1
  # DELETE /kills/1.xml
  def destroy
    @kill = Kill.find(params[:id])
    @kill.destroy

    respond_to do |format|
      format.html { redirect_to(kills_url) }
      format.xml  { head :ok }
    end
  end
end
