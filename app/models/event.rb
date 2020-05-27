class Event < ApplicationRecord
    has_many :competitors
    has_many :bets
    belongs_to :sport
end
