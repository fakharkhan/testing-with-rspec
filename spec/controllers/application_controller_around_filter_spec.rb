require 'spec_helper'

class ApplicationController < ActionController::Base
	around_filter :an_around_filter

	def an_around_filter
		@callback_invoked = true
		yield
	end
end

describe ApplicationController do
	controller do
		def index
			render :nothing => true
		end
	end

	it "invokes the callback" do
		get :index
		expect(assigns[:callback_invoked]).to be_true
	end
end