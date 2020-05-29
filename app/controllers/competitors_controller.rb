class CompetitorsController < ApplicationController
    def display
        @selected = []

        @sports = Sport.get_names("Comp")
        @selected[0] = session[:last_sport_name] || @sports.sample # so fire
        
        @subs = Sport.get_names("Comp", "sub_name", "sport_name = '#{@selected[0]}'")
        @selected[1] = session[:last_sub_sport_name] || @subs.sample
        
        @selected[1] = @subs.sample unless @subs.include?(@selected[1])  #useful catch since we're not using JS to repopulate sub_name select -> force to use new param
        
        @comp = Competitor.all.where(sport_name: @selected[0], sub_name: @selected[1])
    end

    def filter
        @selected = params[:sport_name], params[:sub_name]
        session[:last_sport_name] = @selected[0]
        session[:last_sub_sport_name] = @selected[1]
        redirect_to choose_competitors_path(sport_name: @selected[0], sub_name: @selected[1])
    end

    def show
        @comp = Competitor.find(params[:id])
    end
end
