class TennisCourtsController < ApplicationController
  def index
    @tennis_courts = TennisCourts.all
  end
end
