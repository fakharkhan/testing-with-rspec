require "spec_helper"

describe "widgets/widget.html.erb" do
  it "renders the HTML template" do
    render

    expect(rendered).to match /HTML/
  end
end

describe "widgets/widget.xml.erb" do
  it "renders the XML template" do
    render

    expect(rendered).to match /XML/
  end
end