require "spec_helper"

describe "rendering locals in a partial" do
  it "displays the widget" do
    widget = stub_model(Widget, :name => "slicer")

    render "widgets/widget", :widget => widget

    expect(rendered).to match /slicer/
  end
end