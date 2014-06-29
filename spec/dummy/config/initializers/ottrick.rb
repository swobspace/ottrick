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

  config.ticket_zoom_url = ENV['TICKET_ZOOM_URL']

  ##################################################
  # Parameter for the Otrs generic interface
  ##################################################
  # ---
  # endpoint for soap
  # Example: 
  # config.endpoint = https://localhost/otrs/nph-genericinterface.pl/Webservice/GenericTicketConnector"
  # Default: nil
  # ---
  config.endpoint = ENV['ENDPOINT']

  # --- 
  # wsdl: local file or url
  # you can download the wsdl file from https://raw.githubusercontent.com/OTRS/otrs/rel-3_3/development/webservices/GenericTicketConnector.wsdl
  # 
  # Example:
  # config.wsdl = "GenericTicketConnector.wsdl"
  # ---
  config.wsdl = File.expand_path(File.join(Rails.root, '../../spec/fixtures/otrs/GenericTicketConnector.wsdl'))

  # --- 
  # basic auth
  # only neccessary if you use OTRS with http_authenication
  # must be a valid OTRS user with http_authentication
  # ---
  config.http_auth_user = ENV['HTTP_AUTH_USER']
  config.http_auth_passwd = ENV['HTTP_AUTH_PASSWD']

  # --- 
  # UserLogin and Password for web service operations
  # if you use http_authentication, use a dummy string here (can't be left blank)
  # otherwise set credential for a valid OTRS user.
  # ---
  config.otrs_user = ENV['OTRS_USER']
  config.otrs_passwd = ENV['OTRS_PASSWD']

end
