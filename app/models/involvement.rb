class Involvement < ApplicationRecord
    belongs_to :competitor
    belongs_to :event
    accepts_nested_attributes_for :competitor
end