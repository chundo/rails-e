class Archive < ApplicationRecord
  belongs_to :product
  validates_presence_of :archive
  mount_uploader :archive, ArchiveUploader
end
