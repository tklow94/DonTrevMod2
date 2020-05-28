class Sport < ApplicationRecord
    has_many :events


    def display
        "#{sport_name} - #{sub_name}"
    end
    
    def has_competitors?
        !!Competitor.find_by(sport_name: sport_name)
    end

    def self.get_names(with = nil)
        case with
        when "Comp"
            return Sport.all.select{|x| x.has_competitors?}.pluck(:sport_name).uniq
        else
            return Sport.all.pluck(:sport_name).uniq
        end
    end
end
