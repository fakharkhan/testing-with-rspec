require "spec_helper"

describe "gadgets/list" do
  it "renders the gadget partial for each gadget" do
    assign(:gadgets, [
      mock_model(Gadget, :id => 1, :name => "First"),
      mock_model(Gadget, :id => 2, :name => "Second")
    ])
    stub_template "gadgets/_gadget.html.erb" => "<%= gadget.name %><br/>"
    render
    expect(rendered).to match /First/
    expect(rendered).to match /Second/
  end
end