require 'rails_helper'

RSpec.describe "archives/edit", type: :view do
  before(:each) do
    @archive = assign(:archive, Archive.create!())
  end

  it "renders the edit archive form" do
    render

    assert_select "form[action=?][method=?]", archive_path(@archive), "post" do
    end
  end
end
