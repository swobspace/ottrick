require 'rails_helper'

RSpec.describe "tickets/show", :type => :view do
  before(:each) do
    @ticket = assign(:ticket, Ticket.create!(
      :ticketfor => nil,
      :ticketfor_type => "Ticketfor Type",
      :sender => "Sender",
      :queue => nil,
      :subject => "Subject",
      :text => "MyText",
      :ticketnumber => "Ticketnumber",
      :otrs_ticket_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Ticketfor Type/)
    expect(rendered).to match(/Sender/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Subject/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Ticketnumber/)
    expect(rendered).to match(/1/)
  end
end
