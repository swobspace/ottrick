require 'rails_helper'

module Ottrick
RSpec.describe "ottrick/tickets/edit", :type => :view, modify: false do
  helper Ottrick::ApplicationHelper
  let(:task) { FactoryGirl.create(:task) }
  before(:each) do
    allow(controller).to receive(:controller_name) { "ottrick_tickets" }
    allow(controller).to receive(:action_name) { "edit" }

    @ticket = assign(:ticket, FactoryGirl.create(:ticket,
      :ticketfor_id => task.id, 
      :ticketfor_type => task.class.name,
      :sender => "MyString",
      :otrs_queue_id => 1,
      :subject => "MyString",
      :text => "MyText"
    ))
  end

  it "renders the edit ticket form" do
    render

    assert_select "form[action=?][method=?]", ottrick.ticket_path(@ticket), "post" do

      assert_select "select#ticket_ticketfor_id[name=?]", "ticket[ticketfor_id]"

      assert_select "select#ticket_ticketfor_type[name=?]", "ticket[ticketfor_type]"

      assert_select "input#ticket_sender[name=?]", "ticket[sender]"

      assert_select "select#ticket_otrs_queue_id[name=?]", "ticket[otrs_queue_id]"

      assert_select "input#ticket_subject[name=?]", "ticket[subject]"

      assert_select "textarea#ticket_text[name=?]", "ticket[text]"
    end
  end
end
end
