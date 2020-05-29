class MarketsController < ApplicationController
    def show
        @market = Market.find(params[:id])
        @event = @market.event
        @other_markets = @event.markets.reject{|x| x == @market}
        @sport = @event.sport
        @comps = @event.competitors
    end
end