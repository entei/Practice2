class ComputersController < ApplicationController
  skip_before_filter :authorize, only: [:show]
  # GET /computers
  # GET /computers.json
  #def index
  #  @computers = Computer.all
  #  @station_id = params[:station_id]
  #  #respond_to do |format|
  #  #  format.html # index.html.erb
  #  #  format.json { render json: @computers }
  #  #end
  #end

  # GET /computers/1
  # GET /computers/1.json
  def show
    @computer = Computer.find(params[:id])
    @station_id = params[:station_id]
    #respond_to do |format|
    # format.html # show.html.erb
    # format.json { render json: @computer }
    #end
  end

  # GET /computers/new
  # GET /computers/new.json
  def new
    @region_id = params[:region_id]
    @station_id = params[:station_id]
    @district_id = params[:district_id]
    @computer = Computer.new

    #respond_to do |format|
    #  format.html # new.html.erb
    #  format.json { render json: @computer }
    #end
  end

  # GET /computers/1/edit
  def edit
    @computer = Computer.find(params[:id])
    @region_id = params[:region_id]
    @station_id = params[:station_id]
    @district_id = params[:district_id]
  end

  # POST /computers
  # POST /computers.json
  def create
  #  @computer = @station.computers.new(params[:computer])
    @computer = Computer.new(params[:computer])

    @region = Region.find_by_id(@computer.region_id)
    @district = District.find_by_id(@computer.district_id)
    @station = Station.find_by_id(@computer.station_id)

    @node = @region || @district || @station #look for where we came

 # p "#{@computer.station_id} STATION_ID"

    respond_to do |format|
      if @computer.save
        #redirect_to  station_path(2)
        format.html { redirect_to @node, notice: 'Computer was successfully created.' }
        format.json { head :no_content }
      else
        format.html { render action: "new" }
        format.json { render json: @computer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /computers/1
  # PUT /computers/1.json
  def update
    @computer = Computer.find(params[:id])

    @region = Region.find_by_id(@computer.region_id)
    @district = District.find_by_id(@computer.district_id)
    @station = Station.find_by_id(@computer.station_id)

    @node = @region || @district || @station #look for where we came

    respond_to do |format|
      if @computer.update_attributes(params[:computer])
        format.html { redirect_to @node, notice: 'Computer was successfully updated.' }
        format.json { head :no_content }
      else
        render action: "edit"
        format.html { render action: "edit" }
        format.json { render json: @computer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /computers/1
  # DELETE /computers/1.json
  def destroy
    @computer = Computer.find(params[:id])
   
    @region = Region.find_by_id(@computer.region_id)
    @district = District.find_by_id(@computer.district_id)
    @station = Station.find_by_id(@computer.station_id)

    @node = @region || @district || @station #look for where we came
    @computer.destroy

    respond_to do |format|
      format.html { redirect_to @node }
      format.json { head :no_content }
    end
  end
end
