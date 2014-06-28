module Ottrick
  class Engine < ::Rails::Engine
    isolate_namespace Ottrick

    config.generators do |g|
      g.test_framework :rspec
      g.integration_tool :rspec
      g.templates.unshift File::expand_path('../../templates', __FILE__)
    end

    config.autoload_paths += Dir["#{config.root}/app/models/ottrick/concerns"]
  end
end
