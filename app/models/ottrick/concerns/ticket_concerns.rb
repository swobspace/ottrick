require 'active_support/concern'

module TicketConcerns
  extend ActiveSupport::Concern

  included do
    after_create :create_otrs_ticket
  end

  def create_otrs_ticket
    otrs_ticket = Ottick::Ticket.new()
    response    = otrs_ticket.create(self.subject, self.text, ticket_create_params)

    if response.nil? or response.errors.any?
      errors.add(:base, I18n.t('ottrick.errors.ticket_not_created'))
      raise ActiveRecord::RecordInvalid.new(self)
    else
      update_columns(otrs_ticket_id: response['ticket_id'],
		     ticketnumber: response['ticket_number'])
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
