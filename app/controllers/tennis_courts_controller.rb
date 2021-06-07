class TennisCourtsController < ApplicationController
  def index
    @tennis_courts = TennisCourts.all
  end

  def destroy
    @tennis_court = TennisCourt.find(params[:id])
    @tennis_court.destroy
  end
end
