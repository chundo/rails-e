# == Schema Information
#
# Table name: archives
#
#  id         :integer          not null, primary key
#  archive    :string
#  product_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Archive < ApplicationRecord
  belongs_to :product
  validates_presence_of :archive
  mount_uploader :archive, ArchiveUploader
end
