class SportsController < ApplicationController
    def show
        @market = Market.find(params[:id])
    end

    def display
        @sports = Sport.get_names
        @selected = params[:sport_name] || @sports.sample # so fire
        
        @subs = Sport.get_names(nil, "sub_name", "sport_name = '#{@selected}'")
        @sports_objs = Sport.all.where(sport_name: @selected)
    end


    def filter
        @selected = params[:sport_name], params[:sub_name]  
        redirect_to choose_sports_path(sport_name: @selected[0], sub_name: @selected[1])
    end
end
