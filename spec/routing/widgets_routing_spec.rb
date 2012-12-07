require "spec_helper"

describe WidgetsController do
  describe "routing" do

    it "routes to #index" do
      get("/widgets").should route_to("widgets#index")
    end

    it "routes to #new" do
      get("/widgets/new").should route_to("widgets#new")
    end

    it "routes to #show" do
      get("/widgets/1").should route_to("widgets#show", :id => "1")
    end

    it "routes to #edit" do
      get("/widgets/1/edit").should route_to("widgets#edit", :id => "1")
    end

    it "routes to #create" do
      post("/widgets").should route_to("widgets#create")
    end

    it "routes to #update" do
      put("/widgets/1").should route_to("widgets#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/widgets/1").should route_to("widgets#destroy", :id => "1")
    end

  end
end

describe "routes for widgets" do
  it "routes /widgets to the widgets controller" do
    expect(get("/widgets")).
    to route_to(:controller => "widgets", :action => "index")
  end

  it "does not route to widgets/foo/bar" do
    expect(:get => "/widgets/foo/bar").not_to be_routable
  end

  it "routes to /widgets" do
    expect(:get => "/widgets").to be_routable
  end
end

# describe "routes for widgets" do
#   it "routes /widgets/foo to the /foo action" do
#     expect(get("/widgets/foo")).to route_to("widgets#foo")
#   end
# end

describe "routes to the widgets controller" do
  it "routes a named route" do
    expect(:get => new_widget_path).to route_to(:controller => "widgets", :action => "new")
  end
end