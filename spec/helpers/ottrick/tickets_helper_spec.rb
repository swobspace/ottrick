require 'rails_helper'

module Ottrick
  RSpec.describe TicketsHelper, :type => :helper do
    it "returns link to your OTRS system" do
      ticket = FactoryGirl.create(:ticket, ticketnumber: "12345")
      expect(otrs_ticket_link(ticket, :number)).to match /TicketNumber=12345/
      # expect(otrs_ticket_link(ticket, :number)).to match /#{Ottrick.ticket_zoom_url};TicketNumber=12345/
    end
  end
end
