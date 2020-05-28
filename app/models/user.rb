class User < ApplicationRecord
    has_many :watch_lists
    
    has_secure_password
    validates :username, :email, :password, presence: true
    validates :username, :email, uniqueness: true


    def my(kind)
        watch_lists.where("kind = '#{kind}'").map {|x| x.retrieve}
    end
end


