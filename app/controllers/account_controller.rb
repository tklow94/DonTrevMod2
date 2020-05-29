class AccountController < ApplicationController
    before_action :set_user   
    after_action :transfer_purge_data, only: [:data_maintenance]

    def add_watch_list
        if params["model_ids"]
            params["model_ids"].each do |f|
                current_user.watch_lists.find_or_create_by(kind: params[:kind], model_id: f)
            end
        elsif params["model_id"]
            current_user.watch_lists.find_or_create_by(kind: params[:kind], model_id: params[:model_id])
        else  #3rd way to create from 'sneaky' form
            hit = params.keys.find{|x| x.split(".").count > 1}
            current_user.watch_lists.find_or_create_by(kind: params[:kind], model_id: hit.split(".x")[0]) if hit
        end
        #do we need error checking?
        redirect_back fallback_location: home_path
    end

    def remove_watch_list
        gotcha = current_user.watch_lists.find_by(kind: params[:kind], model_id: params[:model_id].to_i)
        gotcha.destroy if gotcha

        redirect_back fallback_location: home_path
    end

    def wipe_assoc
        current_user.watch_lists.destroy_all
        redirect_back fallback_location: home_path
    end

    def data_maintenance
        byebug
        @assoc_string = pluralize(current_user.watch_lists.count, "association")
        @not_in_future = query_build
        @one_day_old = query_build(1.day)
        @one_hour_old = query_build(1.hour)
        @radio_options = [{name: "purge_type", value: "one_day_old_event_ids", count: @one_day_old.count, message: " started 24 hours ago", checked: true},
                                {name: "purge_type", value: "one_hour_old_event_ids", count: @one_hour_old.count, message: " started 1 hour ago", checked: false},  
                                {name: "purge_type", value: "not_in_future_event_ids", count: @not_in_future.count, message: " have already started", checked: false}]
    end

    def purge_data
        purge = Event.where(id: session[params[:purge_type]])
        x = Time.now
        purge.destroy_all unless purge.empty?
        puts "Operation took #{Time.now - x} seconds"
        redirect_back fallback_location: home_path
    end

private
    def query_build(seconds_in_past = 0)
        Event.where('start_time < ?', Time.now - seconds_in_past).pluck(:id)
    end

    def set_user
        @user = current_user
    end

    def transfer_purge_data
        session[:one_day_old_event_ids] = @one_day_old
        session[:one_hour_old_event_ids] = @one_hour_old
        session[:not_in_future_event_ids] = @not_in_future
    end
end