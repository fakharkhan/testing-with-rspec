require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the WidgetsHelper. For example:
#
# describe WidgetsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe WidgetsHelper do
  describe "#widget_title" do
  	it "includes the app name" do
  	  assign(:title, "This Widget")
  	  expect(helper.widget_title).to eq("The App: This Widget")
  	end
  end
end
