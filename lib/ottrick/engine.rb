module Ottrick
  class Engine < ::Rails::Engine
    isolate_namespace Ottrick

    config.generators do |g|
      g.test_framework :rspec
      g.integration_tool :rspec
    end
  end
end
