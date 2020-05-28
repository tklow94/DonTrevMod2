class CompetitorsController < ApplicationController
    def display
        @selected = params[:sport_name]
        if @selected
            @comp = Competitor.all.where(sport_name: @selected)
        else
            @comp = Competitor.all
        end
        @sports = Sport.get_names("Comp")
    end

    def filter
        @selected = params[:sport_name]
        redirect_to choose_competitors_path(sport_name: @selected)
    end

    def show
        @comp = Competitor.find(params[:id])
    end
end
