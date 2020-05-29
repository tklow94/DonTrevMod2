class AccountController < ApplicationController
    def home
        @user = User.first
    end

    def add_watch_list
        params["model_ids"].each do |f|
            current_user.watch_lists.find_or_create_by(kind: params[:kind], model_id: f)
        end
        # current_user.save  #error check this shit!
        redirect_to home_path
    end

    def remove_watch_list
        # byebug
        gotcha = current_user.watch_lists.find_by(kind: params[:kind], model_id: params[:model_id].to_i)
        
        gotcha.destroy if gotcha
        current_user.watch_lists.reset
        go_home
    end
end