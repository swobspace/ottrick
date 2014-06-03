require 'rails_helper'

RSpec.describe "otrs_queues/index", :type => :view do
  before(:each) do
    assign(:otrs_queues, [
      OtrsQueue.create!(
        :name => "Name",
        :otrs_queue_id => 1
      ),
      OtrsQueue.create!(
        :name => "Name",
        :otrs_queue_id => 1
      )
    ])
  end

  it "renders a list of otrs_queues" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
