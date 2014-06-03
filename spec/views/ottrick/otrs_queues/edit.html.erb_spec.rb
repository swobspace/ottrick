require 'rails_helper'

RSpec.describe "otrs_queues/edit", :type => :view do
  before(:each) do
    @otrs_queue = assign(:otrs_queue, OtrsQueue.create!(
      :name => "MyString",
      :otrs_queue_id => 1
    ))
  end

  it "renders the edit otrs_queue form" do
    render

    assert_select "form[action=?][method=?]", otrs_queue_path(@otrs_queue), "post" do

      assert_select "input#otrs_queue_name[name=?]", "otrs_queue[name]"

      assert_select "input#otrs_queue_otrs_queue_id[name=?]", "otrs_queue[otrs_queue_id]"
    end
  end
end
