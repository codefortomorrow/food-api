class FoodNewsship < ActiveRecord::Base
    belongs_to :food
    belongs_to :news
end
