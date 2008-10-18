class VolleysController < ApplicationController
  # GET /volleys
  # GET /volleys.xml
  def index
    @volleys = Volley.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @volleys }
    end
  end

  # GET /volleys/1
  # GET /volleys/1.xml
  def show
    @volley = Volley.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @volley }
    end
  end

  # GET /volleys/new
  # GET /volleys/new.xml
  def new
    @volley = Volley.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @volley }
    end
  end

  # GET /volleys/1/edit
  def edit
    @volley = Volley.find(params[:id])
  end

  # POST /volleys
  # POST /volleys.xml
  def create
    @volley = Volley.new(params[:volley])

    respond_to do |format|
      if @volley.save
        flash[:notice] = 'Volley was successfully created.'
        format.html { redirect_to(@volley) }
        format.xml  { render :xml => @volley, :status => :created, :location => @volley }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @volley.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /volleys/1
  # PUT /volleys/1.xml
  def update
    @volley = Volley.find(params[:id])

    respond_to do |format|
      if @volley.update_attributes(params[:volley])
        flash[:notice] = 'Volley was successfully updated.'
        format.html { redirect_to(@volley) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @volley.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /volleys/1
  # DELETE /volleys/1.xml
  def destroy
    @volley = Volley.find(params[:id])
    @volley.destroy

    respond_to do |format|
      format.html { redirect_to(volleys_url) }
      format.xml  { head :ok }
    end
  end
end
