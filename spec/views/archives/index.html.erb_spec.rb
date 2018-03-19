require 'rails_helper'

RSpec.describe "archives/index", type: :view do
  before(:each) do
    assign(:archives, [
      Archive.create!(),
      Archive.create!()
    ])
  end

  it "renders a list of archives" do
    render
  end
end
