require 'rails_helper'

RSpec.describe "otrs_queues/show", :type => :view do
  before(:each) do
    @otrs_queue = assign(:otrs_queue, OtrsQueue.create!(
      :name => "Name",
      :otrs_queue_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/1/)
  end
end
