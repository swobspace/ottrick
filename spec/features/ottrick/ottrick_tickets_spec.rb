require 'rails_helper'

RSpec.describe "Tickets", type: :feature do
  describe "GET /ottrick_tickets" do

    it "works! (now write some real specs)" do
      visit ottrick.tickets_path
      expect(current_path).to eq(ottrick.tickets_path)
    end
  end
end
