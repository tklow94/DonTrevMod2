class Competitor < ApplicationRecord
    has_many :involvements, inverse_of: :competitor
    has_many :events, through: :involvements



    def assoc_wagers
        events.inject(0) do |sum, e|
            sum += e.markets.count
            sum
        end
    end
end
