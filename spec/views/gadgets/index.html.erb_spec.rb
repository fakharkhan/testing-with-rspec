require "spec_helper"

describe "gadgets/index" do
  it "renders the index template" do
    assign(:gadgets, [stub_model(Gadget)])
    render

    expect(view).to render_template(:index)
    expect(view).to render_template("index")
    expect(view).to render_template("gadgets/index")
  end
end