include ActionView::Helpers::TextHelper

class Event < ApplicationRecord
    has_many :involvements, inverse_of: :event
    has_many :competitors, through: :involvements
    has_many :markets
    has_many :outcomes, through: :markets
    belongs_to :sport


    def display
        "#{description} * #{sport.display} * #{format_start}"
    end

    def format_start
        start_time.strftime("%B %d %Y")
    end

    def starts_in
        delta = (start_time - Time.now).to_i
        return "Started" if delta <= 0
        res = []

        weeks = delta / 604800
        if weeks > 0
            res << pluralize(weeks, "week")
            delta %= 604800
        end

        days = delta / 86400
        if days > 0
            res << pluralize(days, "day")
            delta %= 86400
        end

        hours = delta / 3600
        if hours > 0
            res << pluralize(hours, "hour")
            delta %= 3600
        end

        minutes = delta / 60
        if minutes > 0
            res << pluralize(minutes, "minute")
            delta %= 60
        end

        res << pluralize(delta, "second")
        res[0..1].join(" ")        
    end
end
