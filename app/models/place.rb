class Place < ActiveRecord::Base
  attr_accessible :address, :category_id, :city_id, :cuisine_id, :description, :name, :phone, :reviews_attributes, :picture, :remote_picture_url, :website
#  has_many :pictures
  has_many :reviews
  accepts_nested_attributes_for :reviews, allow_destroy:true
  belongs_to :city
  belongs_to :category
  belongs_to :cuisine
  mount_uploader :picture, PictureUploader
  validates :name, :address, :description, :phone, presence:true
  
end
