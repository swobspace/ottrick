Used generators
===============

Plugin new
----------

    bin/rails plugin new ottrick --mountable -T --dummy-path=spec/dummy --skip-bundle

Generators
----------

    bin/rails g wobapphelpers:install --force
    bin/rails g wobapphelpers:scaffold_templates
    bin/rails g rspec:install
    bin/rails g simple_form:install --bootstrap --skip

... now adapt spec_helper.rb ...

Ticket
------

    bin/rails g scaffold Ticket ticketfor:references ticketfor_type:string \
                sender:string queue:references subject:string text:text

Queue
------

    bin/rails g scaffold Queue name:string otrs_queue_id:integer

    

    
