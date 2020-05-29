class AccountController < ApplicationController
    before_action :set_user   

    def add_watch_list
        if params["model_ids"]
            params["model_ids"].each do |f|
                current_user.watch_lists.find_or_create_by(kind: params[:kind], model_id: f)
            end
        elsif params["model_id"]
            current_user.watch_lists.find_or_create_by(kind: params[:kind], model_id: params[:model_id])
        else
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
        go_home
    end

private
    def set_user
        @user = current_user
    end
end