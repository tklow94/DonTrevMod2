class AccountController < ApplicationController
    def home
        @user = User.first
    end
end