class AddPriceToTennisCourts < ActiveRecord::Migration[6.0]
  def change
    add_monetize :tennis_courts, :price, currency: { present: false }
  end
end
