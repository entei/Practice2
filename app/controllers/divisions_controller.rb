class DivisionsController < ApplicationController
  def new
    @division = Division.new
  end

  def show
    @division = Division.find(params[:id])
    @title = Division.name
  end

  def create
    @division = Division.new(params[:division])
    if @division.save
      flash[:success] = "Division has been create"
      redirect_to @division
    else
      render 'new'
    end
  end
end
