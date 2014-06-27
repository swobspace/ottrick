require "rails_helper"
require "generator_spec"
require "generators/ottrick/install_generator"

module Ottrick
 module Generators
  RSpec.describe InstallGenerator, type: :generator do
    destination File.expand_path("../../../tmp", __FILE__)

    before(:all) do
      prepare_destination
      run_generator
    end

    it "creates locales" do
      assert_file "config/locales/ottrick.de.yml"
      assert_file "config/locales/ottrick.en.yml"
    end

    it "copies initalizer template file" do
      assert_file "config/initializers/ottrick.rb" do |init|
	assert_match(/Ottrick.setup/, init)
      end
    end
  end
 end
end
