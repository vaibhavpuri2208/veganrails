class Cuisine < ActiveRecord::Base
  attr_accessible :name
  has_many :places
end
