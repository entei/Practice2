class StationsController < ApplicationController
  # GET /stations
  # GET /stations.json
  def index
    @stations = Station.all
    @stations = Station.search(params[:search])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @stations }
    end
  end

  # GET /stations/1
  # GET /stations/1.json
  def show
    @station = Station.find(params[:id])
    @district = District.find_by_id(@station.district_id)
    @modems = @station.modems.paginate(page: params[:page])
    @printers = @station.printers.paginate(page: params[:page])
    @devices = @station.devices.paginate(page: params[:page])
    @computers = @station.computers.paginate(page: params[:page])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @station }
    end
  end

  # GET /stations/new
  # GET /stations/new.json
  def new
    @station = Station.new
    @district_id = params[:district_id]
    @district = District.find_by_id(@district_id)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @station }
    end
  end

  # GET /stations/1/edit
  def edit
    @station = Station.find(params[:id])
    @district_id = params[:district_id]
  end

  # POST /stations
  # POST /stations.json
  def create
    @station = Station.new(params[:station])
    @district = District.find_by_id(@station.district_id)
    
    respond_to do |format|
      if @station.save
        format.html { redirect_to @district, notice: 'Station was successfully created.' }
        format.json { render json: @district, status: :created, location: @district }
      else
        format.html { render action: "new" }
        format.json { render json: @station.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /stations/1
  # PUT /stations/1.json
  def update
    @station = Station.find(params[:id])

    respond_to do |format|
      if @station.update_attributes(params[:station])
        format.html { redirect_to @station, notice: 'Station was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @station.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stations/1
  # DELETE /stations/1.json
  def destroy
    @station = Station.find(params[:id])
    @station.destroy

redirect_to :back
  end

  def add_device
    @station = Station.find(params[:id])
  end

end
