class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @tennis_court = TennisCourt.find(params[:tennis_court_id])
    @review.tennis_court = @tennis_court
    @review.user = current_user
    if @review.save!
      redirect_to tennis_court_path(@tennis_court)
    else
      flash[:alert] = "Something went wrong."
      redirect_to tennis_court_path(@tennis_court)
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to tennis_court_path(@review.tennis_court)
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

end
