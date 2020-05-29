class AccountController < ApplicationController
    def home
        @user = current_user
    end

    def add_watch_list
        params["model_ids"].each do |f|
            current_user.watch_lists.find_or_create_by(kind: params[:kind], model_id: f)
        end
        #do we need error checking?
        go_home
    end

    def remove_watch_list
        gotcha = current_user.watch_lists.find_by(kind: params[:kind], model_id: params[:model_id].to_i)
        gotcha.destroy if gotcha
        go_home
    end
end