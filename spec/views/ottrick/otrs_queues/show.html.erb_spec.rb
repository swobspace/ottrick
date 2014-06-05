require 'rails_helper'

module Ottrick
  RSpec.describe "ottrick/otrs_queues/show", :type => :view do
    before(:each) do
      @otrs_queue = assign('otrs_queue', OtrsQueue.create!(
	:name => "Name",
	:otrs_queue_id => 1
      ))
    end

    it "renders attributes in <p>" do
      pending "name spacing wobapphelpers link not yet resolved"
      render
      expect(rendered).to match(/Name/)
      expect(rendered).to match(/1/)
    end
  end
end
