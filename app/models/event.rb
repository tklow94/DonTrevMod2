class Event < ApplicationRecord
    has_many :competitors
    has_many :markets
    has_many :outcomes, through: :markets
    belongs_to :sport
end
