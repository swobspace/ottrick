require "ottrick/engine"

module Ottrick

  def self.setup
    yield self
  end

  # ticketfor_types: your models for which you would create one or more tickets
  # ottrick uses a polymorphic association:
  #
  # Ottrick::Ticket < ActiveRecord::Base
  #   belongs_to :ticketfor, polymorphic: true
  # end
  # 
  # so your model should be defined like this:
  #
  # MyModel < ActiveRecord::Base
  #   has_many :tickets, as: :ticketfor
  # end
  # 
  # Example: config.ticketfor_types = ["MyModel"]
  #
  # ticketfor_types = []
  #
  mattr_accessor :ticketfor_types
  @@ticketfor_types = [ ]

  # OTRS ticket zoom url 
  # Example:
  # ticket_zoom_url = http://localhost/otrs/index.pl?Action=AgentTicketZoom
  mattr_accessor :ticket_zoom_url
  @@ticket_zoom_url = ''

  # delegate accessors for the otrs generic Interface to Ottick
  # see https://github.com/swobspace/ottick/blob/master/lib/ottick.rb
  # for more information
  #
  OTTICK_ACCESSORS = [
    "endpoint",		# endpoint for soap
    "wsdl",		# i.e. GenericTicketConnector.wsdl
    "http_auth_user",	# basic auth user if OTRS is configured with http_authentication
    "http_auth_passwd",	# 
    "otrs_user",	# valid OTRS user
    "otrs_passwd",	# 
    "ticket_queue",	# ticket queue used as default
    "ticket_priority",	# ticket priority used as default
    "ticket_state",	# ticket state used as default
    "ticket_type",	# ticket type used as default
    "customer_user",	# sender email address used as default
    "article_sender_type", # defaults ...
    "article_charset",	   # 
    "article_mime_type",   # 
  ]
   
  OTTICK_ACCESSORS.each do |m|
    define_singleton_method m.to_sym do
      Ottick.send(m)
    end
    define_singleton_method (m + '=').to_sym do |param|
      Ottick.send(m + '=', param)
    end
  end
end
