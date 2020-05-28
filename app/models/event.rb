class Event < ApplicationRecord
    has_many :involvements, inverse_of: :event
    has_many :competitors, through: :involvements
    has_many :markets
    has_many :outcomes, through: :markets
    belongs_to :sport


    def display
        "#{description} * #{sport.display} * #{format_date}"
    end

private
    def format_date
        start_time.strftime("%B %d %Y")
    end
end
