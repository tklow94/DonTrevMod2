class Sport < ApplicationRecord
    has_many :events


    def display
        "#{sport_name} - #{sub_name}"
    end
end
