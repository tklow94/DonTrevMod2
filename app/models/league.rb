class League < ApplicationRecord
    has_many :teams 
    has_many :events, through: :teams
end
