class CompetitorsController < ApplicationController
    def choose
        if params[:sport_name]
            @comp = Competitor.all.where(sport_name: params[:sport_name])
        else
            @comp = Competitor.all
        end
    end

    def show
        @comp = Competitor.find(params[:id])
    end
end
