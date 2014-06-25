require "rails_helper"

module Ottrick
  RSpec.describe TicketsController, :type => :routing do
    routes { Ottrick::Engine.routes }

    describe "routing" do

      it "routes to #index" do
        expect(:get => "/tickets").to route_to("ottrick/tickets#index")
      end

      it "routes to #new" do
        expect(:get => "/tickets/new").to route_to("ottrick/tickets#new")
      end

      it "routes to #show" do
        expect(:get => "/tickets/1").to route_to("ottrick/tickets#show", :id => "1")
      end

      it "routes to #edit" do
        expect(:get => "/tickets/1/edit").to route_to("ottrick/tickets#edit", :id => "1")
      end

      it "routes to #create" do
        expect(:post => "/tickets").to route_to("ottrick/tickets#create")
      end

      it "routes to #update" do
        expect(:put => "/tickets/1").to route_to("ottrick/tickets#update", :id => "1")
      end

      it "routes to #destroy" do
        expect(:delete => "/tickets/1").to route_to("ottrick/tickets#destroy", :id => "1")
      end

    end
  end
end
