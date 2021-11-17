class User < ApplicationRecord
    has_many :trucks, dependent: :destroy
end
