# == Schema Information
#
# Table name: shopping_carts
#
#  id         :integer          not null, primary key
#  status     :boolean
#  ip         :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ShoppingCart < ApplicationRecord
    has_many :products, through: :in_shopping_carts
    has_many :in_shopping_carts
    
    def total
        suma = 0.0
        in_shopping_carts.each do |pro|
            suma += pro.product.pricing
        end
        suma 
    end
end
