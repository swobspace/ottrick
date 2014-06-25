require 'rails_helper'

module Ottrick
  RSpec.describe OtrsQueue, :type => :model do
   it { should have_many(:tickets) }
   it { should validate_presence_of(:name) }
   it { should validate_uniqueness_of(:name) }

    it "should get plain factory working" do
      f = FactoryGirl.create(:otrs_queue)
      g = FactoryGirl.create(:otrs_queue)
      assert g.valid?
      assert f.valid?
    end
  end
end
