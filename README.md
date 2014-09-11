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
gem 'ottrick', git: 'https://github.com/swobspace/ottrick.git' , branch: "master"
```

Usage
-----
Ottrick creates a ticket in OTRS and stores some ticket data like queue,
sender, subject, body, OTRS ticket number and OTRS ticket id in the database 
as model Ottrick::Ticket. You can use ottrick itself, but the intended use
is as helper for other models. Think about an application for record meetings
and writing protocols. OTRS should be use for tracking activities:

```ruby
class Protocol < ActiveRecord::Base
  has_many :tickets, as: :ticketfor, class: Ottrick::Ticket
end
```
`:ticketfor` is polymorphic association. To access your models from Ottrick::Ticket,
your models have to be set in `config.ticketfor_types` (see Configuration).
The ottrick_tickets#new form should be called from protocols#show prefilled with
sender, subject and text from protocols. After execute create ottrick_tickets
ticket number and ticket id returned from OTRS are also stored in ottrick_ticket object.

### Javascript helper

The Ottrick::Ticket#new form uses a polymorphic selector which groups all possible
objects configured in ticketfor_types by model. Ottrick comes with a small javascript helper
to narrow the possible object selection to the preselected model type. Add
the following line to your application.js:

```javascript
//= require ottrick/ottrick
```

Configuration
-------------
Create an initializer and edit it for your needs:
```ruby
rails g ottrick:install
```

```ruby
Ottrick.setup do |config|
  config.ticketfor_types = ["Protocol"]
  config.ticket_zoom_url = "http://localhost/otrs/index.pl?Action=AgentTicketZoom"

  # ---
  # configuration for OTRS generic interface

  config.wsdl = "/path/to/GenericTicketGenerator.wsdl"
  config.endpoint = "http(s)://yourhost/otrs/nph-genericinterface.pl/Webservice/GenericTicketConnector"
  config.otrs_user = your_valid_otrs_user
  config.otrs_passwd = your_valid_otrs_password
end
```

More configuration options for the OTRS generic interface can be found in
[swobspace/ottick/lib/ottick.rb](https://github.com/swobspace/ottick/blob/master/lib/ottick.rb). Use it on your own risk. Changing defaults may break ottrick.

### Special case: OTRS HTTPBasicAuth
If you have set `AuthModule` to `Kernel::System::Auth::HTTPBasicAuth` in OTRS/Kernel/Config.pm, you need to set http authentication params too:

```ruby
Ottrick.setup do |config|
  ...
  config.http_auth_user   = your_valid_otrs_and_http_user
  config.http_auth_passwd = your_valid_http_password
  ...
end
```
In case of HTTP authentication, http_auth_user must be a valid otrs user and
be able to login via http. All actions to read and create tickets in otrs
are done with http_auth_user. otrs_user and otrs_passwd must be specified, but 
are only used as dummy. This is the current behavior of the OTRS generic 
interface implementation and may change in the future.

Example
-----
A simple example is the [spec/dummy](spec/dummy) application
included in this rails engine.

Licence
-------

ottrick Copyright (C) 2014  Wolfgang Barth

MIT license, see [LICENSE](LICENSE)

