class Event < ApplicationRecord
    # belongs_to :teams
    has_many :bets
end
