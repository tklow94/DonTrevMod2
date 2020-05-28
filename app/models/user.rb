class User < ApplicationRecord
    has_many :watch_lists
    
    has_secure_password
    validates :username, :email, :password, presence: true
    validates :username, :email, uniqueness: true


    def my_outcomes
        watch_lists.where("kind = 'Outcome'")
    end

    def my_competitors
        watch_lists.where("kind = 'Competitor'")
    end

    def my_markets
        watch_lists.where("kind = 'Market'")
    end

    def my_events
        watch_lists.where("kind = 'Event'")
    end

    def my_sports
        watch_lists.where("kind = 'Sport'")
    end
end


