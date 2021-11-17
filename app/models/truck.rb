class Truck < ApplicationRecord
  belongs_to :user
  belongs_to :type_truck
  has_many :appointments, :dependent => :destroy
end
