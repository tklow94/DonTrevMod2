class WatchList < ApplicationRecord
  belongs_to :user

  def retrieve
    case kind
      when "Competitor"
        return Competitor.find(model_id)
      when "Outcome"
        return Outcome.find(model_id)
      when "Event"
        return Event.find(model_id)
      when "Market"
        return Market.find(model_id)
    end
  end

end
