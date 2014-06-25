require 'rails_helper'

module Ottrick
 RSpec.describe "tickets/show", :type => :view do
  before(:each) do
    @ticket = assign(:ticket, Ticket.create!(
      :ticketfor_id => 1234,
      :ticketfor_type => "Ticketfor Type",
      :sender => "Sender",
      :queue_id => 1,
      :subject => "Subject",
      :text => "MyText",
      :ticketnumber => "Ticketnumber",
      :otrs_ticket_id => 99
    ))
  end

  it "renders attributes in <p>" do
    pending "name spacing wobapphelpers link not yet resolved"
    render
    expect(rendered).to match(/1234/)
    expect(rendered).to match(/Ticketfor Type/)
    expect(rendered).to match(/Sender/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Subject/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Ticketnumber/)
    expect(rendered).to match(/99/)
  end
 end
end
