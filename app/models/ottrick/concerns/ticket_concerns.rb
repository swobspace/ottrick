require 'active_support/concern'

module TicketConcerns
  extend ActiveSupport::Concern

  included do
    after_create :create_otrs_ticket
    after_rollback :log_rollback_reason
  end

  def create_otrs_ticket
    otrs_ticket = Ottick::Ticket.new()
    response    = otrs_ticket.create(self.subject, self.text, ticket_create_params)
    Rails.logger.debug("#### DEBUG #####: #{ticket_create_params.inspect}")

    if otrs_ticket.errors.any?
      errors.add(:base, error_msg(otrs_ticket))
      raise ActiveRecord::RecordInvalid.new(self)
    else
      update_attributes(otrs_ticket_id: response[:ticket_id],
		     ticketnumber: response[:ticket_number])
      return true
    end
  end

  def log_rollback_reason
    Rails.logger.info(self.errors.full_messages.join('; ')) if self.errors.full_messages.any?
  end

  private

  def ticket_create_params
    { "Ticket" =>
      {
	"Queue" => self.otrs_queue.to_s,
	"CustomerUser" => self.sender.to_s
      }
    }
  end

  def error_msg(subject)
    msg = I18n.t('ottrick.errors.otrs_ticket_not_created')
    if subject.nil?
      msg += ": empty object"
    elsif subject.errors.any?
      msg += ": #{subject.errors.join(', ')}"
    end
    msg
  end
end
