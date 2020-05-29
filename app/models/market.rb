class Market < ApplicationRecord
    has_many :outcomes, dependent: :destroy
    belongs_to :event
    
end