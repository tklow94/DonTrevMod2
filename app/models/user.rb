class User < ApplicationRecord
    has_many :sports
    has_many :leagues, through: :sports
    has_secure_password
    validates :username, :email, :password, presence: true
    validates :username, :email, uniqueness: true
end
