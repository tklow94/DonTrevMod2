class WatchList < ApplicationRecord
  belongs_to :user
  
  def retrieve
    case kind
      when "Comp"
        return Competitor.find(model_id)
      when "Out"
        return Outcome.find(model_id)
      when "Event"
        return Event.find(model_id)
      when "Market"
        return Market.find(model_id)
      when "Sport"
        return Sport.find(model_id)
    end
  end

end
