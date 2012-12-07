require "spec_helper"

describe "rendering the widget template" do
  it "displays the widget" do
    assign(:widget, stub_model(Widget, :name => "slicer"))

    render :template => "widgets/widget.html.erb"

    expect(rendered).to match /slicer/
  end
end