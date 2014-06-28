module Ottrick
  class Ticket < ActiveRecord::Base
    include TicketConcerns

    # -- associations
    belongs_to :ticketfor, polymorphic: true
    belongs_to :otrs_queue

    # -- configuration
    # -- validations and callbacks
    validates :subject, :text, :sender, :otrs_queue_id, :presence => true

    def to_s
      "#{ticketnumber} #{subject}"
    end

  end
end
