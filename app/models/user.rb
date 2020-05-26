class User < ApplicationRecord
    has_many :sports
    has_many :leagues, through: :sports
end
