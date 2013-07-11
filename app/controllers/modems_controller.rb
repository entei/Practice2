class ModemsController < ApplicationController
  skip_before_filter :authorize, only: [:show]
  # GET /modems
  ## GET /modems.json
  #def index
  #  @modems = Modem.all
  #
  #  @station_id = params[:station_id]
  #  #respond_to do |format|
  #  #  format.html # index.html.erb
  #  #  format.json { render json: @modems }
  #  #end
  #end

  # GET /modems/1
  # GET /modems/1.json
  def show
    @modem = Modem.find(params[:id])
    @station_id = params[:station_id]
=begin
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @modem }
    end
=end
  end


  # GET /modems/new
  # GET /modems/new.json
  def new
    @modem = Modem.new
    @station_id = params[:station_id] #get station_id

    #------------------тут ошибка>
    #   respond_to do |format|
    #     format.html # new.html.erb
    #     format.json { render json: @modem }
    #   end
  end

  # GET /modems/1/edit
  def edit
    @modem = Modem.find(params[:id])
    @station_id = params[:station_id]
  end

  # POST /modems
  # POST /modems.json
  def create
    @station = Station.find_by_id(params[:station_id])
    @modem = @station.modems.new(params[:modem])


    respond_to do |format|
      if @modem.save
        # redirect_to station_path(@station)
        format.html { redirect_to station_path(@station), notice: 'Modem was successfully created.' }
        format.json { render json: @modem, status: :created, location: @modem }
      else
        redirect_to station_path(@station)
        #format.html { render action: "new" }
      end
    end
  end

  # PUT /modems/1
  # PUT /modems/1.json
  def update
    @modem = Modem.find(params[:id])

    respond_to do |format|
      if @modem.update_attributes(params[:modem])
        #redirect_to station_modem_path(@modem.station_id, @modem)
        format.html { redirect_to station_modem_path(@modem.station_id, @modem), notice: 'Modem was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @modem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /modems/1
  # DELETE /modems/1.json
  def destroy
    @modem = Modem.find(params[:id])
    @station_id = @modem.station_id
    @modem.destroy

    respond_to do |format|
      format.html { redirect_to station_path(@station_id) }
      format.json { head :no_content }
    end
  end
end
