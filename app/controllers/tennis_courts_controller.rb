class TennisCourtsController < ApplicationController
  def index
    @tennis_courts = TennisCourt.all
  end

  def new
    @tennis_court = TennisCourt.new
  end

  def show
    @tennis_court = TennisCourt.find(params[:id])
    @schedule = Schedule.new
  end

  def create
    @tennis_court = TennisCourt.new(tennis_court_params)
    @tennis_court.user = current_user
    if @tennis_court.save!
      redirect_to tennis_court_path(@tennis_court)
    else
      render :new
    end
  end

  def destroy
    @tennis_court = TennisCourt.find(params[:id])
    @tennis_court.destroy
  end

  def edit
    @tennis_court = TennisCourt.find(params[:id])
  end

  def update
    @tennis_court = TennisCourt.find(params[:id])
    @tennis_court.update(tennis_court)
    redirect_to tennis_court_path(@tennis_court)
  end

  private

  def tennis_court_params
    params.require(:tennis_court).permit(:court_name, :address, :price_per_hour, :description, :surface_type)
  end
end
