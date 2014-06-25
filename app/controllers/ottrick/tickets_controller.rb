require_dependency "ottrick/application_controller"

module Ottrick
  class TicketsController < ApplicationController
    before_action :set_ticket, only: [:show, :edit, :update, :destroy]
    before_action :add_breadcrumb_show, only: [:show]

    # GET /tickets
    def index
      @tickets = Ticket.all
      respond_with(@tickets)
    end

    # GET /tickets/1
    def show
      respond_with(@ticket)
    end

    # GET /tickets/new
    def new
      @ticket = Ticket.new
      respond_with(@ticket)
    end

    # GET /tickets/1/edit
    def edit
    end

    # POST /tickets
    def create
      @ticket = Ticket.new(ticket_params)

      @ticket.save
      respond_with(@ticket)
    end

    # PATCH/PUT /tickets/1
    def update
      @ticket.update(ticket_params)
      respond_with(@ticket)
    end

    # DELETE /tickets/1
    def destroy
      @ticket.destroy
      respond_with(@ticket)
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_ticket
        @ticket = Ticket.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def ticket_params
        params.require(:ticket).permit(:ticketfor_id, :ticketfor_type, :sender, :otrs_queue_id, :subject, :text)
      end
  end
end
