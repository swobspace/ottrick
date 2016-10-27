require 'rails_helper'

RSpec.describe "OtrsQueues", type: :feature do
  describe "GET /ottrick_otrs_queues" do

    it "works! (now write some real specs)" do
      visit ottrick.otrs_queues_path
      expect(current_path).to eq(ottrick.otrs_queues_path)
    end
  end
end
