module Ottrick
  module Ticket
    module Concerns
      extend ActiveSupport::Concern

      included do
        before_create :create_otrs_ticket
      end

      def create_otrs_ticket
        raise "Hallowob"
        otrs_ticket = Ottick::Ticket.new()
        response    = otrs_ticket.create(self.subject, self.text, create_params)
        if response['ticket_id'].nil?
          errors.add(:base, t('ottrick.errors.ticket_not_created'))
          return false
        else
          self[:otrs_ticket_id] = response['ticket_id']
          self[:ticketnumber] = response['ticket_id']
          return true
        end
      end

      private

      def ticket_create_params
        {
          "Queue" => self.otrs_queue.to_s,
          "CustomerUser" => self.sender.to_s
        }
      end
    end
  end
end
