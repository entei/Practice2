class RegionsController < ApplicationController
  # GET /regions
  # GET /regions.json
  def index
    @regions = Region.all
    @districts = District.all
    

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @regions }
    end
  end

  # GET /regions/1
  # GET /regions/1.json
  def show

    @region = Region.find(params[:id])
    @districts = @region.districts

    @modems = @region.modems.paginate(page: params[:page])
    @printers = @region.printers.paginate(page: params[:page])
    @devices = @region.devices.paginate(page: params[:page])
    @computers = @region.computers.paginate(page: params[:page])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @region }
    end
  end

  # GET /regions/new
  # GET /regions/new.json
  def new
    @region = Region.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @region }
    end
  end

  # GET /regions/1/edit
  def edit
    @region = Region.find(params[:id])
  end

  # POST /regions
  # POST /regions.json
  def create
    @region = Region.new(params[:region])

    respond_to do |format|
      if @region.save
        format.html { redirect_to @region, notice: 'Region was successfully created.' }
        format.json { render json: @region, status: :created, location: @region }
      else
        format.html { render action: "new" }
        format.json { render json: @region.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /regions/1
  # PUT /regions/1.json
  def update
    @region = Region.find(params[:id])

    respond_to do |format|
      if @region.update_attributes(params[:region])
        format.html { redirect_to @region, notice: 'Region was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @region.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /regions/1
  # DELETE /regions/1.json
  def destroy
    @region = Region.find(params[:id])
    @region.destroy

    respond_to do |format|
      format.html { redirect_to regions_url }
      format.json { head :no_content }
    end
  end



  def report
    @region_id = params[:region_id].to_i
    @region = Region.find{|a| a.id == @region_id}
    @computers = Computer.all
    @districts = District.all
    @allstations = Station.all
    @comp_count = Array.new(6) 
    @comp_count = [0,0,0,0,0,0]

    @comp_count[0] += @computers.find_all{|a|a.region_id == @region_id}.find_all{|a| a.comp_class == "1" }.count
    @comp_count[1] += @computers.find_all{|a|a.region_id == @region_id}.find_all{|a| a.comp_class == "2" }.count
    @comp_count[2] += @computers.find_all{|a|a.region_id == @region_id}.find_all{|a| a.comp_class == "3" }.count
    @comp_count[3] += @computers.find_all{|a|a.region_id == @region_id}.find_all{|a| a.comp_class == "4" }.count
    @comp_count[4] += @computers.find_all{|a|a.region_id == @region_id}.find_all{|a| a.comp_class == "5" }.count
    @comp_count[5] += @computers.find_all{|a|a.region_id == @region_id}.find_all{|a| a.comp_class == "6" }.count


    @districts = @districts.find_all{|a| a.region_id == @region_id}
    @stations = Array.new

    @districts.each do |district| 
      @comp_count[0] += @computers.find_all{|a|a.district_id == district.id}.find_all{|a| a.comp_class == "1" }.count
      @comp_count[1] += @computers.find_all{|a|a.district_id == district.id}.find_all{|a| a.comp_class == "2" }.count
      @comp_count[2] += @computers.find_all{|a|a.district_id == district.id}.find_all{|a| a.comp_class == "3" }.count
      @comp_count[3] += @computers.find_all{|a|a.district_id == district.id}.find_all{|a| a.comp_class == "4" }.count
      @comp_count[4] += @computers.find_all{|a|a.district_id == district.id}.find_all{|a| a.comp_class == "5" }.count
      @comp_count[5] += @computers.find_all{|a|a.district_id == district.id}.find_all{|a| a.comp_class == "6" }.count

      @comp_count[1]+=district.id
      @stations+=@allstations.find_all{|a|a.district_id == district.id}
      


    end

    @stations.each do |station|
      @comp_count[0] += @computers.find_all{|a|a.station_id == station.id}.find_all{|a| a.comp_class == "1" }.count
      @comp_count[1] += @computers.find_all{|a|a.station_id == station.id}.find_all{|a| a.comp_class == "2" }.count
      @comp_count[2] += @computers.find_all{|a|a.station_id == station.id}.find_all{|a| a.comp_class == "3" }.count
      @comp_count[3] += @computers.find_all{|a|a.station_id == station.id}.find_all{|a| a.comp_class == "4" }.count
      @comp_count[4] += @computers.find_all{|a|a.station_id == station.id}.find_all{|a| a.comp_class == "5" }.count
      @comp_count[5] += @computers.find_all{|a|a.station_id == station.id}.find_all{|a| a.comp_class == "6" }.count

    end

    @summ = 0

    @comp_count.each do |count|
      @summ += count
    end

   

    
  end

end