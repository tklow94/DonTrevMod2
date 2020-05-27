class Market < ApplicationRecord
    has_many :outcomes
    belongs_to :event
    
end