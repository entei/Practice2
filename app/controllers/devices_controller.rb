class DevicesController < ApplicationController
  skip_before_filter :authorize, only: [:show]
  # GET /devices
  # GET /devices.json
  #def index
  #  @devices = Device.all
  #  @station_id = params[:station_id]
  #  #respond_to do |format|
  #  #  format.html # index.html.erb
  #  #  format.json { render json: @devices }
  #  #end
  #end

  # GET /devices/1
  # GET /devices/1.json
  def show
    @device = Device.find(params[:id])
        @region_id = params[:region_id]
    @station_id = params[:station_id]
    @district_id = params[:district_id]
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @device }
    end
  end

  # GET /devices/new
  # GET /devices/new.json
  def new
    @device = Device.new
    @region_id = params[:region_id]
    @station_id = params[:station_id]
    @district_id = params[:district_id]
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @device }
    end
  end

  # GET /devices/1/edit
  def edit
    @device = Device.find(params[:id])
    @region_id = params[:region_id]
    @station_id = params[:station_id]
    @district_id = params[:district_id]
  end

  # POST /devices
  # POST /devices.json
  def create
   
    @device = Device.new(params[:device])

     @region = Region.find_by_id(@device.region_id)
    @district = District.find_by_id(@device.district_id)
    @station = Station.find_by_id(@device.station_id)

    @node = @region || @district || @station #look for where we came

    respond_to do |format|
      if @device.save
        #redirect_to station_path(@station)
        format.html { redirect_to @node, notice: 'Device was successfully created.' }
        format.json { render json: @device, status: :created, location: @device }
      else
        format.html { render action: "new" }
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /devices/1
  # PUT /devices/1.json
  def update
    @device = Device.find(params[:id])

     @region = Region.find_by_id(@device.region_id)
    @district = District.find_by_id(@device.district_id)
    @station = Station.find_by_id(@device.station_id)

    @node = @region || @district || @station #look for where we came

    respond_to do |format|
      if @device.update_attributes(params[:device])
        # redirect_to station_device_path(@device.station_id, @device)
        format.html { redirect_to @node, notice: 'Device was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @device.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /devices/1
  # DELETE /devices/1.json
  def destroy
    @device = Device.find(params[:id])
    
   @region = Region.find_by_id(@device.region_id)
    @district = District.find_by_id(@device.district_id)
    @station = Station.find_by_id(@device.station_id)

    @node = @region || @district || @station #look for where we came
    @device.destroy


redirect_to :back
  end
end
