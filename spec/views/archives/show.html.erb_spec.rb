require 'rails_helper'

RSpec.describe "archives/show", type: :view do
  before(:each) do
    @archive = assign(:archive, Archive.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
