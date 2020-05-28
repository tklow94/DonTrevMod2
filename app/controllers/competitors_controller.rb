class CompetitorsController < ApplicationController
    def display
        @selected = []

        @sports = Sport.get_names("Comp")
        @selected[0] = params[:sport_name] || @sports.sample # so fire
        
        @subs = Sport.get_names("Comp", "sub_name", "sport_name = '#{@selected[0]}'")
        @selected[1] = params[:sub_name] || @subs.sample
        
        @comp = Competitor.all.where(sport_name: @selected[0], sub_name: @selected[1])
    end

    def filter
        @selected = params[:sport_name], params[:sub_name]  #gross, refactor into only GET ... no POST
        redirect_to choose_competitors_path(sport_name: @selected[0], sub_name: @selected[1])
    end

    def show
        @comp = Competitor.find(params[:id])
    end
end
