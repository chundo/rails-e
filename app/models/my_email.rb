# == Schema Information
#
# Table name: my_emails
#
#  id         :integer          not null, primary key
#  email      :string
#  ip         :string
#  state      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class MyEmail < ApplicationRecord
    validates_presence_of :email, message: "Woop! You Email Is Nil"
    validates_uniqueness_of :email, message: "Woop! You Email exists"
    #/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates_format_of :email, with: Devise::email_regexp
end
