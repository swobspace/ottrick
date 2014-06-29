# -------------------------------------------
# just to check your local system environment
# for correct setup for OTRS generic interface

require 'rails_helper'

describe 'Ottrick Setup' do
  it "wsdl is a real file" do
    puts Ottrick.wsdl
    expect(File.exists?(Ottrick.wsdl)).to be_truthy
  end

  it "endpoint is set from ENV" do
    puts Ottrick.endpoint
    expect(Ottrick.endpoint.blank?).to be_falsey
  end

  it "otrs credentials are set from ENV" do
    expect(Ottrick.otrs_user.blank?).to be_falsey
    expect(Ottrick.otrs_passwd.blank?).to be_falsey
  end
end

