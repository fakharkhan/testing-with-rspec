require 'spec_helper'

class ValidatingWidget < ActiveRecord::Base
	self.table_name= :widgets
	validates_presence_of :name

	attr_accessible :name if Rails.version < '4'
	validates_length_of :name, :minimum => 10, :on => :publication
end

describe ValidatingWidget do
	it "fails validation with no name (using error_on)" do
		expect(ValidatingWidget.new).to have(1).error_on(:name)
	end

	it "fails validation with no name (using errors_on)" do
		expect(ValidatingWidget.new).to have(1).errors_on(:name)
	end

	it "fails validation with no name expecting a specific message" do
		expect(ValidatingWidget.new.errors_on(:name)).to include("can't be blank")
	end

	it "fails validation with short name (using a validation context)" do
		expect(ValidatingWidget.new(:name => "too short")).
		to have(1).errors_on(:name, :context => :publication)
	end

	it "passes validation with longer name(using a validation context)" do
		expect(ValidatingWidget.new(:name => "a longer name")).
		to have(0).errors_on(:name, :context => :publication)
	end

	it "passes validation with a name (using 0)" do
		expect(ValidatingWidget.new(:name => "liquid nitrogen")).to have(0).errors_on(:name)
	end

	it "passes validation with a name (using :no)" do
		expect(ValidatingWidget.new(:name => "liquide nitrogen")).to have(:no).errors_on(:name)
	end
end

# RSpec.configure do |c|
# 	c.use_transactional_examples =true
# end

RSpec.configure do |c|
	c.use_transactional_examples = false
	c.order = "default"
end

describe Widget do
	# let!(:widgets) { Array.new(3) { Widget.create } }
	# subject { Widget.scoped }

	it "has none to begin with" do
		expect(Widget.count).to eq 0
	end

	it "has one after adding one" do
		Widget.create
		expect(Widget.count).to eq 1
	end

	it "has none after one was created in a previous example" do
		expect(Widget.count).to eq 1
	end

	after(:all) { Widget.destroy_all }

	context "when initialized" do
		subject(:widget) { Widget.new }

		it "is a new widget" do
			expect(widget).to be_a_new(Widget)
		end

		it "is not a string" do
			expect(widget).not_to be_a_new(String)
		end
	end

	context "when saved" do
		subject(:widget) { Widget.create }

		it "is not a new widget" do
			expect(widget).not_to be_a_new(Widget)
		end

		it "is not a new string" do
			expect(widget).not_to be_a_new(String)
		end
	end

	# it "returns all widgets in any order" do
	# 	expect(subject).to match_array(widgets)
	# end
end

describe Widget do
	it "uses the existing constant" do
		widget = mock_model("Widget")
		expect(widget).to be_a(Widget)
	end
end

describe Widget do
  let(:widget) { mock_model(Widget) }

  it "is valid by default" do
    expect(widget).to be_valid
  end

  it "is not a new record by default" do
    expect(widget).not_to be_new_record
  end

  it "can be converted to a new record" do
    expect(widget.as_new_record).to be_new_record
  end

  it "sets :id to nil upon destroy" do
    widget.destroy
    expect(widget.id).to be_nil
  end
end


describe "mock_model(Widget) with stubs" do
  let(:widget) do
    mock_model Widget, :foo => "bar",
                       :save => true,
                       :update_attributes => false
  end

  it "supports stubs for methods that don't exist in ActiveModel or ActiveRecord" do
    expect(widget.foo).to eq("bar")
  end

  it "supports stubs for methods that do exist" do
    expect(widget.save).to eq(true)
    expect(widget.update_attributes).to be_false
  end

  describe "#errors" do
    context "with update_attributes => false" do
      it "is not empty" do
        expect(widget.errors).not_to be_empty
      end
    end
  end
end