ottrick
=======

Mountable Rails engine to create OTRS tickets over the generic webservices interface.

**WORK IN PROGRESS, USE IT AT YOUR OWN RISK.**

Requirements
------------
* tested with rails 4.1 and ruby 2.0
* may run with rails 3.2 and ruby 1.9.3

Installation
------------

```ruby
gem 'ottrick', git: https://github.com/swobspace/ottrick.git, branch: "master"
```

Usage
-----
(just to record the idea, description not yet finished)

Ottrick creates a ticket in OTRS and stores some ticket data like queue,
sender, subject, body, OTRS ticket number and OTRS ticket id in the database 
as model Ottrick::Ticket. You can use ottrick itself, but the intended use
is as helper for other models. Think about an application for record meetings
and writing protocols. OTRS should be use for tracking activities:

```ruby
class Protocol < ActiveRecord::Base
  has_many :tickets, as: :ticketfor
end
```
The ottrick_tickets#new form should be called from protocols#show prefilled with
sender, subject and text from protocols. After execute create ottrick_tickets
ticket number and ticket id returned from OTRS are also stored in ottrick_ticket object.

TBD

Configuration
-------------
Create an initializer and edit it for your needs:
```ruby
rails g ottrick:install
```

```ruby
Ottrick.setup do |config|
  config.ticketfor_types = ["MyStuff"]  

  # ---
  # configuration for OTRS generic interface

  config.wsdl = "/path/to/GenericTicketGenerator.wsdl"
  config.endpoint = "http(s)://yourhost/otrs/nph-genericinterface.pl/Webservice/GenericTicketConnector"
  config.otrs_user = your_valid_otrs_user
  config.otrs_passwd = your_valid_otrs_password

  # likely to be set to match your configuration
  conf.ticket_queue = your_incoming_queue
 ...
end
```
More configuration options for the OTRS generic interface can be found in
[swobspace/ottick/lib/ottick.rb](https://github.com/swobspace/ottick/blob/master/lib/ottick.rb). Use it on your own risk. Changing defaults may break ottrick.

Usage
-----
A simple example is the [spec/dummy](spec/dummy) application
included in this rails engine.

Licence
-------

ottrick Copyright (C) 2014  Wolfgang Barth

MIT license, see [LICENSE](LICENSE)

