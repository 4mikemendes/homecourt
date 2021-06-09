class AddTennisCourtReferencesToReviews < ActiveRecord::Migration[6.0]
  def change
    add_reference :reviews, :tennis_court, null: false, foreign_key: true
  end
end
