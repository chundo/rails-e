# == Schema Information
#
# Table name: products
#
#  id                  :integer          not null, primary key
#  name                :string
#  pricing             :decimal(10, 2)
#  description         :text
#  user_id             :integer
#  avatar_file_name    :string
#  avatar_content_type :string
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#  imagen              :string
#  state               :boolean
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Product < ApplicationRecord
  belongs_to :user
  validates_presence_of :name, :user, :pricing
  validates :pricing, numericality: {greater_than: 0}
  mount_uploader :imagen, ImageUploader
  has_many :archives  
end
