# frozen_string_literal: true

require 'rails_helper'

xdescribe "admin/places/new", type: :view do
  before(:each) do
    assign(:admin_place, Place.new)
  end

  it "renders new admin_place form" do
    render

    assert_select "form[action=?][method=?]", admin_places_path, "post" do
    end
  end
end
