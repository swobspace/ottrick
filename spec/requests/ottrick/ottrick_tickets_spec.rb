require 'rails_helper'

RSpec.describe "Tickets", :type => :request do
  describe "GET /ottrick_tickets" do
    it "works! (now write some real specs)" do
      get ottrick_tickets_path
      expect(response.status).to be(200)
    end
  end
end
