class Product < ApplicationRecord
  belongs_to :user
  validates_presence_of :name, :user, :pricing
  validates :pricing, numericality: {greater_than: 0}
  mount_uploader :imagen, ImageUploader
  has_many :archives  
end