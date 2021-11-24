class Truck < ApplicationRecord
  belongs_to :user
  belongs_to :type_truck
  belongs_to :score
  has_many :appointments, :dependent => :destroy
  has_one_attached :picture


  acts_as_votable
end
