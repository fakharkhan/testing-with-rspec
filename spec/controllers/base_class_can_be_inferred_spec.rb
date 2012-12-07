require 'spec_helper'

Rspec.configure do |c|
	c.infer_base_class_for_anonymous_controllers = true
end

class ApplicationController < ActionController::Base; end

class ApplicationControllerSubclass < ApplicationController; end

describe ApplicationControllerSubclass do
	controller do
		def index
			render :text => "Hello World"
		end
	end

	it "creates an anonymous controller derived from ApplicationControllerSubclass" do
		expect(controller).to be_a_kind_of(ApplicationControllerSubclass)
	end
end