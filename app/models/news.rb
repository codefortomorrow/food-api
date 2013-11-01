class News < ActiveRecord::Base
    has_many :food_newsship
    has_many :food, :through => :food_newsship
end
