class Sport < ApplicationRecord
    has_many :events


    def display
        "#{sport_name} - #{sub_name}"
    end
    
    def has_competitors?
        !!Competitor.find_by(sport_name: sport_name, sub_name: sub_name)
    end

    def self.get_names(with = nil, field = "sport_name", filter = nil)
        case with
        when "Comp"
            return Sport.all.where(filter).select{|x| x.has_competitors?}.pluck(field).uniq
        else
            return Sport.all.where(filter).pluck(field).uniq
        end
    end

   
end
