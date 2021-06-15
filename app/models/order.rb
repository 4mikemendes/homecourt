class Order < ApplicationRecord
  belongs_to :user
  belongs_to :tennis_court
  monetize :amount_cents
end
