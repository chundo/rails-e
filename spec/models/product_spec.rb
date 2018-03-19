require 'rails_helper'

RSpec.describe Product, type: :model do
  it{ should validate_presence_of :name }
  it{ should validate_presence_of :user }
  it{ should validate_presence_of :pricing }
  it "should validate pricing > 0" do 
    product =  FactoryBot.build(:product, pricing: 0) #build save in memory after of create
    expect(product.valid?).to be_falsy
    
  end  
end
