Ottrick.setup do |config|
  # ---
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
  # ---
  # config.ticketfor_types = []

  # ---
  # OTRS ticket zoom url 
  # Example:
  # config.ticket_zoom_url = http://localhost/otrs/index.pl?Action=AgentTicketZoom;TicketID=
  # ---
  # config.ticket_zoom_url = ''

  ##################################################
  # Parameter for the Otrs generic interface
  ##################################################
  # ---
  # endpoint for soap
  # Example: 
  # config.endpoint = https://localhost/otrs/nph-genericinterface.pl/Webservice/GenericTicketConnector"
  # Default: nil
  # ---
  # config.endpoint = nil

  # --- 
  # wsdl: local file or url
  # you can download the wsdl file from https://raw.githubusercontent.com/OTRS/otrs/rel-3_3/development/webservices/GenericTicketConnector.wsdl
  # 
  # Example:
  # config.wsdl = "GenericTicketConnector.wsdl"
  # ---
  # config.wsdl = nil

  # --- 
  # basic auth
  # only neccessary if you use OTRS with http_authenication
  # must be a valid OTRS user with http_authentication
  # ---
  # config.http_auth_user = nil
  # config.http_auth_passwd = nil

  # --- 
  # UserLogin and Password for web service operations
  # if you use http_authentication, use a dummy string here (can't be left blank)
  # otherwise set credential for a valid OTRS user.
  # ---
  # config.otrs_user = nil
  # config.otrs_passwd = nil

end
