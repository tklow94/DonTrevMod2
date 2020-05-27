class Event < ApplicationRecord
    has_and_belongs_to_many :competitors
    has_many :markets
    has_many :outcomes, through: :markets
    belongs_to :sport
end
