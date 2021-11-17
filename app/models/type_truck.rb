class TypeTruck < ApplicationRecord
    has_many :trucks, dependent: :destroy
end
