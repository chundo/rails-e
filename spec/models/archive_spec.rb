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

require 'rails_helper'

RSpec.describe Archive, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
