require "spec_helper"

describe "gadgets/edit" do
  before(:each) do
    @gadget = assign(:gadget, stub_model(Gadget))
  end

  it "renders the form partial" do
    stub_template "gadgets/_form.html.erb" => "This content"
    render
    expect(rendered).to match /This content/
  end
end