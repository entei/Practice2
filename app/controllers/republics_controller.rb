class RepublicsController < ApplicationController
  # GET /republics
  # GET /republics.json
  def index
    @republics = Republic.all
    @regions = Region.all
    @districts = District.all
    @stations = Station.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @republics }
    end
  end

  # GET /republics/1
  # GET /republics/1.json
  def show
    @republic = Republic.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @republic }
    end
  end

  # GET /republics/new
  # GET /republics/new.json
  def new
    @republic = Republic.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @republic }
    end
  end

  # GET /republics/1/edit
  def edit
    @republic = Republic.find(params[:id])
  end

  # POST /republics
  # POST /republics.json
  def create
    @republic = Republic.new(params[:republic])

    respond_to do |format|
      if @republic.save
        format.html { redirect_to @republic, notice: 'Republic was successfully created.' }
        format.json { render json: @republic, status: :created, location: @republic }
      else
        format.html { render action: "new" }
        format.json { render json: @republic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /republics/1
  # PUT /republics/1.json
  def update
    @republic = Republic.find(params[:id])

    respond_to do |format|
      if @republic.update_attributes(params[:republic])
        format.html { redirect_to @republic, notice: 'Republic was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @republic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /republics/1
  # DELETE /republics/1.json
  def destroy
    @republic = Republic.find(params[:id])
    @republic.destroy

    respond_to do |format|
      format.html { redirect_to republics_url }
      format.json { head :no_content }
    end
  end
end
