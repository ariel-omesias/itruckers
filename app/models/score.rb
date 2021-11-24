class Score < ApplicationRecord
    has_many :users, dependent: :destroy
    has_many :trucks, dependent: :destroy
end
