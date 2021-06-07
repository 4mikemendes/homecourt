class TennisCourtsController < ApplicationController
  def index
    @tennis_courts = TennisCourts.all
  end

  def new
    @tennis_court = TennisCourt.new
  end


  def create
    @tennis_court = TennisCourt.new(list_params)
    if @tennis_court.save
      redirect_to tennis_court_path(@tennis_court)
    else
      render :new
    end
  end

  private

  def tennis_court_params
    params.require(:tennis_court).permit(:court_name, :address, :price_per_hour, :description, :surface_type, :created_at, :updated_at)
  end

end
