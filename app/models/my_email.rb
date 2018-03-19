class MyEmail < ApplicationRecord
    validates_presence_of :email, message: "Woop! You Email Is Nil"
    validates_uniqueness_of :email, message: "Woop! You Email exists"
    #/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates_format_of :email, with: Devise::email_regexp
end
