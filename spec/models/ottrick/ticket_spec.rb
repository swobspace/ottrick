require 'rails_helper'

module Ottrick
  RSpec.describe Ticket, :type => :model do
    it { should belong_to(:ticketfor) }
    it { should belong_to(:queue) }
    it { should validate_presence_of(:subject) }
    it { should validate_presence_of(:text) }
    it { should validate_presence_of(:sender) }
    it { should validate_presence_of(:queue_id) }

    it "should get plain factory working" do
      f = FactoryGirl.create(:ticket)
      g = FactoryGirl.create(:ticket)
      assert g.valid?
      assert f.valid?
    end
  end
end
