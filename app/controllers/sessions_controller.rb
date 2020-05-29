class SessionsController < ApplicationController
    skip_before_action :require_login
    def create
        user = User.find_by_email(params[:email])
        if user && user.authenticate(params[:password])
          session[:user_id] = user.id
          redirect_to home_path
        else
          redirect_to '/login'
        end
      end
    
      def destroy
        session[:user_id] = nil
        redirect_to '/welcome'
      end
  
  end