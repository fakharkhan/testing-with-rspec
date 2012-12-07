require "spec_helper"

describe "controller.request.path_parameters" do
  it "matches the Rails environment by using symbols for keys" do
    [:controller, :action].each { |k| expect(controller.request.path_parameters.keys).to include(k) }
  end
end