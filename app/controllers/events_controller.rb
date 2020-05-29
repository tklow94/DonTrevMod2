class EventsController < ApplicationController
    def show
        @event = Event.find(params[:id])
    end

    def display
        @selected = []

        @sports = Sport.get_names("Event")
        @selected[0] = params[:sport_name] || @sports.sample # so fire
        
        @subs = Sport.get_names("Event", "sub_name", "sport_name = '#{@selected[0]}'")
        @selected[1] = params[:sub_name] || @subs.sample
        
        @selected[1] = @subs.sample unless @subs.include?(@selected[1])  #useful catch since we're not using JS to repopulate sub_name select -> force to use new param
        
        @events = Sport.find_by(sport_name: @selected[0], sub_name: @selected[1]).events
    end


    def filter
        @selected = params[:sport_name], params[:sub_name]  
        redirect_to choose_events_path(sport_name: @selected[0], sub_name: @selected[1])
    end
end
