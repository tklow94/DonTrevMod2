class SportsController < ApplicationController
    def show
        @sport = Sport.find(params[:id])
        @events = @sport.events
    end

    def display
        @sports = Sport.get_names
        @selected = params[:sport_name] || session[:last_sport_name] || @sports.sample  #3-way pipe dab
        
        @subs = Sport.get_names(nil, "sub_name", "sport_name = '#{@selected}'")
        @sports_objs = Sport.all.where(sport_name: @selected)
    end


    def filter
        @selected = params[:sport_name]
        session[:last_sport_name] = @selected
        redirect_to choose_sports_path(sport_name: @selected)
    end
end
