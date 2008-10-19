class MatchesController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => :push
  
  before_filter :find_match,         :only => [:edit, :update, :destroy, :push, :show]
  before_filter :requires_ownership, :only => [:edit, :update, :destroy]

  # GET /matches
  # GET /matches.xml
  def index
    @matches = Match.paginate :per_page => 20, :page => params[:page]

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @matches }
    end
  end

  # GET /matches/1
  # GET /matches/1.xml
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @match }
    end
  end

  # GET /matches/new
  # GET /matches/new.xml
  def new
    @match = Match.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @match }
    end
  end

  # GET /matches/1/edit
  def edit
  end

  # POST /matches
  # POST /matches.xml
  def create
    @match = Match.new(params[:match])
    @match.admin = current_user

    respond_to do |format|
      if @match.save
        flash[:notice] = "Match was successfully created."
        format.html { redirect_to(@match) }
        format.xml  { render :xml => @match, :status => :created, :location => @match }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @match.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /matches/1
  # PUT /matches/1.xml
  def update
    respond_to do |format|
      if @match.update_attributes(params[:match])
        flash[:notice] = "Match was successfully updated."
        format.html { redirect_to(@match) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @match.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /matches/1
  # DELETE /matches/1.xml
  def destroy
    @match.destroy

    respond_to do |format|
      format.html { redirect_to(matches_url) }
      format.xml  { head :ok }
    end
  end
  
  # POST /matches/1
  def push
    @match.push(params[:payload])
    head :ok
  end
  
  def complete_volley
    @match = Match.find(params[:id])
    if @match.active?
      if current_user == @match.admin
        @match.new_volley
        flash[:notice] = 'Volley completed.'
      else
        flash[:error] = "Please ask the admin to do this for you."
      end
    else
      flash[:error]  = 'This match is closed.'
    end
    redirect_to match_path(@match)
  end
  
  def complete_match
    @match = Match.find(params[:id])
    if current_user == @match.admin
      if @match.active? && 
        @match.update_attributes(:active => false)
        flash[:notice] = 'Match closed.'
      end
    else
      flash[:error] = 'Please ask the admin to do this for you.'
    end
    redirect_to match_path(@match)
  end

  private

    def find_match
      @match = Match.find(params[:id])
    end

    def requires_ownership
      unless @match.admin == current_user
        flash[:warning] = "You aren't the owner of this match."
        redirect_to matches_path
      end
    end
end
