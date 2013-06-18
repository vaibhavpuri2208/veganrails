class Review < ActiveRecord::Base
  attr_accessible :comment, :place_id, :score, :user_id
  belongs_to :place
  belongs_to :user
end
