require "spec_helper"

describe "rendering text directly" do
  it "displays the given text" do

    render :text => "This is directly rendered"

    expect(rendered).to match /directly rendered/
  end
end