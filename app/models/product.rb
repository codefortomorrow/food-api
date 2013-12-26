class Product < ActiveRecord::Base
    belongs_to :company
    #has_many :food_newsship
    #has_many :news, :through => :food_newsship
end
