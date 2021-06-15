class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :profile_picture
  validates :profile_picture, presence: true
  has_many :tennis_courts, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :orders
end
