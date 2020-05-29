class Market < ApplicationRecord
    has_many :outcomes, dependent: :destroy
    belongs_to :event
    
    def full_display
        trunc_pad(description, 18) + trunc_pad(event.sport.display, 50) + trunc_pad(event.description, 50, false)
    end

    
end