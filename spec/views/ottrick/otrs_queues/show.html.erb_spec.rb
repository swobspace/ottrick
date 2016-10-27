require 'rails_helper'

module Ottrick
  RSpec.describe "ottrick/otrs_queues/show", :type => :view do
    before(:each) do
      allow(controller).to receive(:controller_name) { "ottrick_otrs_queues" }
      allow(controller).to receive(:action_name) { "show" }
      @otrs_queue = assign('otrs_queue', OtrsQueue.create!(
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
end
