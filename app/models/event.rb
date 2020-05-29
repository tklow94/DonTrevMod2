include ActionView::Helpers::TextHelper

class Event < ApplicationRecord
    has_many :involvements, inverse_of: :event
    has_many :competitors, through: :involvements
    has_many :markets, dependent: :destroy
    has_many :outcomes, through: :markets
    belongs_to :sport


    def full_display
        "#{description} * #{sport.display} * #{format_start}"
        trunc_pad(sport.display, 50) + trunc_pad(description, 40) + format_start
    end

    def url
        "http://bovada.lv/sports" + link
    end

    def format_start
        start_time.strftime("%B %d %Y")
    end

    def time_until_start
        time_calc(start_time)
    end

    def time_since_updated
        time_calc(last_modified, true) + " ago"
    end

private
    def time_calc(value, reverse = false)
        delta = (value - Time.now).to_i
        return "- - - -" if delta <= 0 && !reverse
        delta = delta.abs if reverse
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
