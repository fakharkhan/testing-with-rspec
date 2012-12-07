require "spec_helper"

#class ApplicationController < ActionController::Base
  
#   class AccessDenied < StandardError; end

#   rescue_from AccessDenied, :with => :access_denied

# private

#   def access_denied
#     redirect_to "/401.html"
#   end
# end

# describe ApplicationController do
#   controller do
#     def index
#       raise ApplicationController::AccessDenied
#     end
#   end

#   describe "handling AccessDenied exceptions" do
#     it "redirects to the /401.html page" do
#       get :index
#       expect(response).to redirect_to("/401.html")
#     end
#   end
# end

describe ApplicationController do
  controller do
    def index
      render :text => "index called"
    end

    def create
      render :text => "create called"
    end

    def new 
      render :text => "new called"
    end

    def show
      render :text => "show called"
    end

    def edit
      render :text => "edit called"
    end

    def update 
      render :text => "update called"
    end

    def destroy
      render :text => "destroy called"
    end

    def willerror
      render :text => "will not render"
    end
  end

  describe "#index" do
    it "responds to GET" do
      get :index
      expect(response.body).to eq "index called"
    end

    it "also responds to POST" do
      post :index
      expect(response.body).to eq "index called"
    end

    it "also responds to PUT" do
      put :index
      expect(response.body).to eq "index called"
    end

    it "also responds to DELETE" do
      delete :index
      expect(response.body).to eq "index called"
    end
  end

  describe "#create" do
    it "responds to POST" do
      post :create
      expect(response.body).to eq "create called"
    end
    %w[get post put delete].each do |calltype|
      it "responds to #{calltype}" do
        send(calltype, :create)
        expect(response.body).to eq "create called"
      end
    end
  end

  describe "#new" do
    it "responds to GET" do
      get :new
      expect(response.body).to eq "new called"
    end

    %w[get post put delete].each do |calltype|
      it "responds to #{calltype}" do
        send(calltype, :new)
        expect(response.body).to eq "new called"
      end
    end
  end

  describe "#edit" do
    it "responds to GET" do 
      get :edit, :id => "anyid"
      expect(response.body).to eq "edit called"
    end

    it "requires the :id parameter" do
      expect{ get :edit }.to raise_error(ActionController::RoutingError)
    end

    %w[get post put delete].each do |calltype|
      it "responds to #{calltype}" do
        send(calltype, :edit, {:id => "anyid"})
        expect(response.body).to eq "edit called"
      end
    end
  end

  describe "#show" do
    it "responds to GET" do
      get :show, :id => "anyid"
      expect(response.body).to eq "show called"
    end

    it "requires the :id parameter" do
      expect{ get :show }.to raise_error(ActionController::RoutingError)
    end

    %w[get post put delete].each do |calltype|
      it "responds to #{calltype}" do
        send(calltype, :show, {:id => "anyid"})
        expect(response.body).to eq "show called"
      end
    end
  end

  describe "#update" do
    it "responds to PUT" do
      put :update, :id => "anyid"
      expect(response.body).to eq "update called"
    end

    it "requires the :id parameter" do
      expect{ put :update }.to raise_error(ActionController::RoutingError)
    end

    %w[get post put delete].each do |calltype|
      it "responds to #{calltype}" do
        send(calltype, :update, {:id => "anyid"})
        expect(response.body).to eq "update called"
      end
    end
  end

  describe "#destroy" do
    it "responds to DELETE" do
      delete :destroy, :id => "anyid"
      expect(response.body).to eq "destroy called"
    end

    it "requires the :id paramete" do
      expect{ delete :destroy }. to raise_error(ActionController::RoutingError)
    end

    %w[get post put delete].each do |calltype|
      it "responds to #{calltype}" do
        send(calltype, :destroy, {:id => "anyid"})
        expect(response.body).to eq "destroy called"
      end
    end
  end

  describe "#willerror" do
    it "can not be called" do
      expect {get :willerror}.to raise_error(ActionController::RoutingError)
    end
  end
end