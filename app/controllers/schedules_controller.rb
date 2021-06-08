class SchedulesController < ApplicationController
  def new
    @schedule = Schedule.new
    @tennis_court = TennisCourt.find(params[:tennis_court_id])
  end

  def create
    @tennis_court = TennisCourt.find(params[:tennis_court_id])
    @schedule = @tennis_court.schedules.new(schedule_params)
    if @schedule.save
      redirect_to tennis_court_path(@tennis_court)
    end
  end

  def destroy
    @schedule.destroy
  end

  private

  def schedule_params
    params.require(:schedule).permit(:time, :tennis_court_id, :created_at, :updated_at)
  end
end
