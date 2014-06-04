require "rails_helper"

module Ottrick
  RSpec.describe OtrsQueuesController, :type => :routing do
    routes { Ottrick::Engine.routes }

    describe "routing" do

      it "routes to #index" do
        expect(:get => "/otrs_queues").to route_to("ottrick/otrs_queues#index")
      end

      it "routes to #new" do
        expect(:get => "/otrs_queues/new").to route_to("ottrick/otrs_queues#new")
      end

      it "routes to #show" do
        expect(:get => "/otrs_queues/1").to route_to("ottrick/otrs_queues#show", :id => "1")
      end

      it "routes to #edit" do
        expect(:get => "/otrs_queues/1/edit").to route_to("ottrick/otrs_queues#edit", :id => "1")
      end

      it "routes to #create" do
        expect(:post => "/otrs_queues").to route_to("ottrick/otrs_queues#create")
      end

      it "routes to #update" do
        expect(:put => "/otrs_queues/1").to route_to("ottrick/otrs_queues#update", :id => "1")
      end

      it "routes to #destroy" do
        expect(:delete => "/otrs_queues/1").to route_to("ottrick/otrs_queues#destroy", :id => "1")
      end

    end
  end
end
