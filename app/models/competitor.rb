class Competitor < ApplicationRecord
    has_many :involvements, inverse_of: :competitor
    has_many :events, through: :involvements

end
