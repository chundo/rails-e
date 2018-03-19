require 'rails_helper'

RSpec.describe MyEmail, type: :model do
  it{ should validate_presence_of(:email).with_message("Woop! You Email Is Nil") }
  it{ should validate_uniqueness_of(:email).with_message("Woop! You Email exists") }
  it "Should not create with invalid email" do
    email = MyEmail.new(email:"chundo")
    expect(email.valid?).to be_falsy
  end
  it "Should not create with invalid email" do
    email = MyEmail.new(email:"chundo@rails-e.com")
    expect(email.valid?).to be_truthy
  end
end
