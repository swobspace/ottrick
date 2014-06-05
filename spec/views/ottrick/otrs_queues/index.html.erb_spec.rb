require 'rails_helper'

module Ottrick
 RSpec.describe "ottrick/otrs_queues/index", :type => :view do
  before(:each) do
    assign(:otrs_queues, [
      OtrsQueue.create!(
        :name => "Name1",
        :otrs_queue_id => 1
      ),
      OtrsQueue.create!(
        :name => "Name2",
        :otrs_queue_id => 2
      )
    ])
  end

  it "renders a list of otrs_queues" do
      pending "name spacing wobapphelpers link not yet resolved"
    render
    assert_select "tr>td", :text => "Name1".to_s, :count => 1
    assert_select "tr>td", :text => "Name2".to_s, :count => 1
    assert_select "tr>td", :text => 1.to_s, :count => 1
    assert_select "tr>td", :text => 2.to_s, :count => 1
  end
 end
end
