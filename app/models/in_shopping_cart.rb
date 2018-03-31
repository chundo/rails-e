# == Schema Information
#
# Table name: in_shopping_carts
#
#  id               :integer          not null, primary key
#  product_id       :integer
#  shopping_cart_id :integer
#  amount           :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class InShoppingCart < ApplicationRecord
  belongs_to :product
  belongs_to :shopping_cart  
  
end
