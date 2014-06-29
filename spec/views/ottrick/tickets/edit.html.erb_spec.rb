require 'rails_helper'

module Ottrick
RSpec.describe "ottrick/tickets/edit", :type => :view, modify: false do
  before(:each) do
    @ticket = assign(:ticket, FactoryGirl.create(:ticket,
      :ticketfor_id => 1234, 
      :ticketfor_type => "MyString",
      :sender => "MyString",
      :otrs_queue_id => 1,
      :subject => "MyString",
      :text => "MyText"
    ))
  end

  it "renders the edit ticket form" do
    pending "name spacing wobapphelpers link not yet resolved"

    render

    assert_select "form[action=?][method=?]", ticket_path(@ticket), "post" do

      assert_select "input#ticket_ticketfor_id[name=?]", "ticket[ticketfor_id]"

      assert_select "input#ticket_ticketfor_type[name=?]", "ticket[ticketfor_type]"

      assert_select "input#ticket_sender[name=?]", "ticket[sender]"

      assert_select "input#ticket_otrs_queue_id[name=?]", "ticket[otrs_queue_id]"

      assert_select "input#ticket_subject[name=?]", "ticket[subject]"

      assert_select "textarea#ticket_text[name=?]", "ticket[text]"
    end
  end
end
end
