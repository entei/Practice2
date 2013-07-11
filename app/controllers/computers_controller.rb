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
    @station_id = params[:station_id]
    @computer = Computer.new

    #respond_to do |format|
    #  format.html # new.html.erb
    #  format.json { render json: @computer }
    #end
  end

  # GET /computers/1/edit
  def edit
    @computer = Computer.find(params[:id])
    @station_id = params[:station_id]
  end

  # POST /computers
  # POST /computers.json
  def create
    @station = Station.find_by_id(params[:station_id])
    @computer = @station.computers.new(params[:computer])

    respond_to do |format|
      if @computer.save
        # redirect_to station_path(@station)
        format.html { redirect_to station_path(@station), notice: 'Computer was successfully created.' }
        format.json { render json: @computer, status: :created, location: @computer }
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

    respond_to do |format|
      if @computer.update_attributes(params[:computer])
        #redirect_to station_computer_path(@computer.station_id, @computer)
        format.html { redirect_to station_computer_path(@computer.station_id, @computer), notice: 'Computer was successfully updated.' }
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
    @station_id = @computer.station_id
    @computer.destroy

    respond_to do |format|
      format.html { redirect_to station_path(@station_id) }
      format.json { head :no_content }
    end
  end
end
