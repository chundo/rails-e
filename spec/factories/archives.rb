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

FactoryBot.define do
  factory :archive do
    archive "MyString"
    product nil
  end
end
