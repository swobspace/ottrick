require 'rails_helper'

describe 'Ottrick engine' do
  it "Ottrick module is available" do
    expect(Ottrick).to be_a_kind_of Module
  end

  it "delegates endpoint and endpoint= to Ottick" do
    Ottrick.endpoint = "example"
    expect(Ottick.endpoint).to be == "example"
    Ottick.endpoint = "reverse back"
    expect(Ottrick.endpoint).to be == "reverse back"
  end

  Ottrick::OTTICK_ACCESSORS.each do |accessor|
    it "delegates #{accessor} to Ottick" do
      Ottrick.send(accessor + '=',  "set value")
      expect(Ottick.send(accessor)).to be == "set value"

      Ottick.send(accessor + '=', "read value back")
      expect(Ottrick.send(accessor)).to be == "read value back"
    end
  end
end

