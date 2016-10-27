require 'rails_helper'

module Ottrick
RSpec.describe "ottrick/tickets/index", :type => :view, modify: false do
  let(:task) { FactoryGirl.create(:task, subject: "MySubject") }
  let(:otrs_queue) {instance_double(OtrsQueue)}
  before(:each) do
    allow(controller).to receive(:controller_name) { "ottrick_tickets" }
    allow(controller).to receive(:action_name) { "index" }
    expect(otrs_queue).to receive(:to_s).twice.and_return("myOtrsQueue")
    expect(otrs_queue).to receive(:id).twice.and_return(123)

    @tickets = [
      FactoryGirl.create(:ticket,
        :ticketfor_id => task.id,
        :ticketfor_type => task.class.name,
        :sender => "Sender",
        :otrs_queue_id => otrs_queue.id,
        :subject => "Subject",
        :text => "MyText",
        :ticketnumber => "Ticketnumber",
        :otrs_ticket_id => 99
      ),
      FactoryGirl.create(:ticket,
        :ticketfor_id => task.id,
        :ticketfor_type => task.class.name,
        :sender => "Sender",
        :otrs_queue_id => otrs_queue.id,
        :subject => "Subject",
        :text => "MyText",
        :ticketnumber => "Ticketnumber",
        :otrs_ticket_id => 99
      )
    ]
    allow(@tickets[0]).to receive(:otrs_queue).and_return(otrs_queue)
    allow(@tickets[1]).to receive(:otrs_queue).and_return(otrs_queue)
  end

  it "renders a list of tickets" do
    render
    puts rendered
    assert_select "tr>td", :text => "(1) MySubject".to_s, :count => 2
    assert_select "tr>td", :text => "Task".to_s, :count => 2
    assert_select "tr>td", :text => "Sender".to_s, :count => 2
    assert_select "tr>td", :text => "Subject".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Ticketnumber".to_s, :count => 2
    assert_select "tr>td", :text => "myOtrsQueue".to_s, :count => 2
  end
end
end
