require 'rails_helper'

module Ottrick
 RSpec.describe "ottrick/tickets/show", :type => :view, modify: false do
  let(:task) { FactoryGirl.create(:task) }
  before(:each) do
    allow(controller).to receive(:controller_name) { "ottrick_tickets" }
    allow(controller).to receive(:action_name) { "show" }
    @ticket = assign(:ticket, FactoryGirl.create(:ticket,
      :ticketfor_id => task.id,
      :ticketfor_type => task.class.name,
      :sender => "Sender",
      :otrs_queue_id => 1,
      :subject => "Subject",
      :text => "MyText",
      :ticketnumber => "Ticketnumber",
      :otrs_ticket_id => 99
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/#{task.id}/)
    expect(rendered).to match(/Task/)
    expect(rendered).to match(/Sender/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/Subject/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Ticketnumber/)
    expect(rendered).to match(/99/)
  end
 end
end
