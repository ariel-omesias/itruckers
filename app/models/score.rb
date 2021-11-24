class Score < ApplicationRecord
    has_many :users
    has_many :trucks

end
