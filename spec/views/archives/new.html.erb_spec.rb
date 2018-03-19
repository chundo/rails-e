require 'rails_helper'

RSpec.describe "archives/new", type: :view do
  before(:each) do
    assign(:archive, Archive.new())
  end

  it "renders new archive form" do
    render

    assert_select "form[action=?][method=?]", archives_path, "post" do
    end
  end
end
