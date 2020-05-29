class AccountController < ApplicationController
    before_action :set_user   

    def add_watch_list
        if params["model_ids"]
            params["model_ids"].each do |f|
                current_user.watch_lists.find_or_create_by(kind: params[:kind], model_id: f)
            end
        end
        #do we need error checking?
        go_home
    end

    def remove_watch_list
        gotcha = current_user.watch_lists.find_by(kind: params[:kind], model_id: params[:model_id].to_i)
        gotcha.destroy if gotcha

        redirect_back fallback_location: home_path
    end

private
    def set_user
        @user = current_user
    end
end