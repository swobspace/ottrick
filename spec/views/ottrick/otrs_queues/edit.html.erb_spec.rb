require 'rails_helper'

module Ottrick
RSpec.describe "ottrick/otrs_queues/edit", :type => :view do
  helper Ottrick::ApplicationHelper

  before(:each) do
    allow(controller).to receive(:controller_name) { "ottrick_otrs_queues" }
    allow(controller).to receive(:action_name) { "edit" }

    @otrs_queue = assign(:otrs_queue, OtrsQueue.create!(
      :name => "MyString",
      :otrs_queue_id => 1
    ))
  end

  it "renders the edit otrs_queue form" do
    render

    assert_select "form[action=?][method=?]", ottrick.otrs_queue_path(@otrs_queue), "post" do

      assert_select "input#otrs_queue_name[name=?]", "otrs_queue[name]"

      assert_select "input#otrs_queue_otrs_queue_id[name=?]", "otrs_queue[otrs_queue_id]"
    end
  end
end
end
