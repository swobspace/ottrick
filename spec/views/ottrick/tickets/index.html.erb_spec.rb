require 'rails_helper'

module Ottrick
RSpec.describe "ottrick/tickets/index", :type => :view do
  before(:each) do
    assign(:tickets, [
      Ticket.create!(
        :ticketfor_id => 1234,
        :ticketfor_type => "Ticketfor Type",
        :sender => "Sender",
        :otrs_queue_id => 1,
        :subject => "Subject",
        :text => "MyText",
        :ticketnumber => "Ticketnumber",
        :otrs_ticket_id => 99
      ),
      Ticket.create!(
        :ticketfor_id => 1234,
        :ticketfor_type => "Ticketfor Type",
        :sender => "Sender",
        :otrs_queue_id => 1,
        :subject => "Subject",
        :text => "MyText",
        :ticketnumber => "Ticketnumber",
        :otrs_ticket_id => 99
      )
    ])
  end

  it "renders a list of tickets" do
    pending "name spacing wobapphelpers link not yet resolved"
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Ticketfor Type".to_s, :count => 2
    assert_select "tr>td", :text => "Sender".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Subject".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Ticketnumber".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
end
