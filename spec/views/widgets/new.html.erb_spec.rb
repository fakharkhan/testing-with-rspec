require "spec_helper"

describe "widgets/new" do
  it "infers the controller path" do
    expect(controller.request.path_parameters[:action]).to eq("new")
  end
end