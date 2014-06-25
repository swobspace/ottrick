module Ottrick
  class Ticket < ActiveRecord::Base
    # -- associations
    belongs_to :ticketfor, polymorphic: true
    belongs_to :queue

    # -- configuration
    # -- validations and callbacks
    validates :subject, :text, :sender, :queue_id, :presence => true

    def to_s
      "#{ticketnumber} #{subject}"
    end

  end
end
