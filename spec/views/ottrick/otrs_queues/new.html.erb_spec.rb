require 'rails_helper'

module Ottrick
 RSpec.describe "ottrick/otrs_queues/new", :type => :view do
  helper Ottrick::ApplicationHelper
  before(:each) do
    allow(controller).to receive(:controller_name) { "ottrick_otrs_queues" }
    allow(controller).to receive(:action_name) { "new" }
    assign(:otrs_queue, OtrsQueue.new(
      :name => "MyString",
      :otrs_queue_id => 1
    ))
  end

  it "renders new otrs_queue form" do
    render

    assert_select "form[action=?][method=?]", ottrick.otrs_queues_path, "post" do

      assert_select "input#otrs_queue_name[name=?]", "otrs_queue[name]"

      assert_select "input#otrs_queue_otrs_queue_id[name=?]", "otrs_queue[otrs_queue_id]"
    end
  end
 end
end
