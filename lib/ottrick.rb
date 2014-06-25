require "ottrick/engine"

module Ottrick

  def self.setup
    yield self
  end

  # ticketfor_types
  #
  mattr_reader :ticketfor_types
  @@ticketfor_types = [ ]

end
