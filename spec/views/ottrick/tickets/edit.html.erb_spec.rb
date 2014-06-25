require 'rails_helper'

RSpec.describe "tickets/edit", :type => :view do
  before(:each) do
    @ticket = assign(:ticket, Ticket.create!(
      :ticketfor => nil,
      :ticketfor_type => "MyString",
      :sender => "MyString",
      :queue => nil,
      :subject => "MyString",
      :text => "MyText"
    ))
  end

  it "renders the edit ticket form" do
    render

    assert_select "form[action=?][method=?]", ticket_path(@ticket), "post" do

      assert_select "input#ticket_ticketfor_id[name=?]", "ticket[ticketfor_id]"

      assert_select "input#ticket_ticketfor_type[name=?]", "ticket[ticketfor_type]"

      assert_select "input#ticket_sender[name=?]", "ticket[sender]"

      assert_select "input#ticket_queue_id[name=?]", "ticket[queue_id]"

      assert_select "input#ticket_subject[name=?]", "ticket[subject]"

      assert_select "textarea#ticket_text[name=?]", "ticket[text]"
    end
  end
end
