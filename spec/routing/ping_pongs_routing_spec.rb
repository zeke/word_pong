require "spec_helper"

describe PingPongsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/ping_pongs" }.should route_to(:controller => "ping_pongs", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/ping_pongs/new" }.should route_to(:controller => "ping_pongs", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/ping_pongs/1" }.should route_to(:controller => "ping_pongs", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/ping_pongs/1/edit" }.should route_to(:controller => "ping_pongs", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/ping_pongs" }.should route_to(:controller => "ping_pongs", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/ping_pongs/1" }.should route_to(:controller => "ping_pongs", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/ping_pongs/1" }.should route_to(:controller => "ping_pongs", :action => "destroy", :id => "1")
    end

  end
end
