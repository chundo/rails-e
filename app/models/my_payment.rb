# == Schema Information
#
# Table name: my_payments
#
#  id         :integer          not null, primary key
#  email      :string
#  ip         :string
#  status     :string
#  fee        :decimal(6, 2)
#  paypal_id  :string
#  total      :decimal(6, 2)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class MyPayment < ApplicationRecord
end
