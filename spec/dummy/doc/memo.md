Customizing dummy application
=============================

Generators
----------

    # config/application.rb
    config.generators do |g|
      g.orm             :active_record
      g.template_engine :erb
      g.test_framework  false
      g.stylesheets     false
      g.javascripts     false
    end

SimpleForm
----------
    bundle exec rails g simple_form:install --bootstrap
