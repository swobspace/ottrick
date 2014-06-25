require 'rails_helper'

RSpec.describe "tickets/index", :type => :view do
  before(:each) do
    assign(:tickets, [
      Ticket.create!(
        :ticketfor => nil,
        :ticketfor_type => "Ticketfor Type",
        :sender => "Sender",
        :queue => nil,
        :subject => "Subject",
        :text => "MyText"
      ),
      Ticket.create!(
        :ticketfor => nil,
        :ticketfor_type => "Ticketfor Type",
        :sender => "Sender",
        :queue => nil,
        :subject => "Subject",
        :text => "MyText"
      )
    ])
  end

  it "renders a list of tickets" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Ticketfor Type".to_s, :count => 2
    assert_select "tr>td", :text => "Sender".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Subject".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
