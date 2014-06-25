module Ottrick
  class Ticket < ActiveRecord::Base
    belongs_to :ticketfor
    belongs_to :queue
  end
end
