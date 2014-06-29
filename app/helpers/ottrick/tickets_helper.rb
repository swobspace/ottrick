module Ottrick
  module TicketsHelper
    def otrs_ticket_link(ticket, variant)
      if variant == :id
        link_to ticket.otrs_ticket_id, 
          "#{Ottrick.ticket_zoom_url};TicketID=#{ticket.otrs_ticket_id}",
	  target: :blank
      elsif variant == :number
        link_to ticket.ticketnumber, 
          "#{Ottrick.ticket_zoom_url};TicketNumber=#{ticket.ticketnumber}",
	  target: :blank
      else
        raise RuntimeError, "ticket link variant #{variant} not yet implemented"
      end
    end
  end
end
