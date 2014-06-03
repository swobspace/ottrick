require 'rails_helper'

RSpec.describe "otrs_queues/new", :type => :view do
  before(:each) do
    assign(:otrs_queue, OtrsQueue.new(
      :name => "MyString",
      :otrs_queue_id => 1
    ))
  end

  it "renders new otrs_queue form" do
    render

    assert_select "form[action=?][method=?]", otrs_queues_path, "post" do

      assert_select "input#otrs_queue_name[name=?]", "otrs_queue[name]"

      assert_select "input#otrs_queue_otrs_queue_id[name=?]", "otrs_queue[otrs_queue_id]"
    end
  end
end
