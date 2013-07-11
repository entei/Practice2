class PrintersController < ApplicationController
  skip_before_filter :authorize, only:[:show]
  # GET /printers
  # GET /printers.json
  #def index
  #  @printers = Printer.all
  #  @station_id = params[:station_id]
  #
  #  #respond_to do |format|
  #  #  format.html # index.html.erb
  #  #  format.json { render json: @printers }
  #  #end
  #end

  # GET /printers/1
  # GET /printers/1.json
  def show
    @printer = Printer.find(params[:id])
    @station_id = params[:station_id]
    #respond_to do |format|
    #  format.html # show.html.erb
    #  format.json { render json: @printer }
    #end
  end

  # GET /printers/new
  # GET /printers/new.json
  def new
    @printer = Printer.new
    @station_id = params[:station_id]
    #respond_to do |format|
    #  format.html # new.html.erb
    #  format.json { render json: @printer }
    #end
  end

  # GET /printers/1/edit
  def edit
    @printer = Printer.find(params[:id])
    @station_id = params[:station_id]
  end

  # POST /printers
  # POST /printers.json
  def create

    @station = Station.find_by_id(params[:station_id])
    @printer = @station.printers.new(params[:printer])
    respond_to do |format|
      if @printer.save
        # redirect_to station_path(@station)
        format.html { redirect_to station_path(@station), notice: 'Printer was successfully created.' }
        format.json { render json: @printer, status: :created, location: @printer }
      else
        format.html { render action: "new" }
        #format.json { render json: @printer.errors, status: :unprocessable_entity }
      end
    end
  end

# PUT /printers/1
# PUT /printers/1.json
  def update
    @printer = Printer.find(params[:id])

    respond_to do |format|
      if @printer.update_attributes(params[:printer])
        # redirect_to station_printer_path(@printer.station_id, @printer)
        format.html { redirect_to station_printer_path(@printer.station_id, @printer), notice: 'Printer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @printer.errors, status: :unprocessable_entity }
      end
    end
  end

# DELETE /printers/1
# DELETE /printers/1.json
  def destroy
    @printer = Printer.find(params[:id])
    @station_id = @printer.station_id
    @printer.destroy

    respond_to do |format|
      format.html { redirect_to station_path(@station_id) }
      format.json { head :no_content }
    end
  end

end
