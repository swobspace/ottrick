require_dependency "ottrick/application_controller"

module Ottrick
  class OtrsQueuesController < ApplicationController
    before_action :set_otrs_queue, only: [:show, :edit, :update, :destroy]
    before_action :add_breadcrumb_show, only: [:show]

    # GET /otrs_queues
    def index
      @otrs_queues = OtrsQueue.all
      respond_with(@otrs_queues)
    end

    # GET /otrs_queues/1
    def show
      respond_with(@otrs_queue)
    end

    # GET /otrs_queues/new
    def new
      @otrs_queue = OtrsQueue.new
      respond_with(@otrs_queue)
    end

    # GET /otrs_queues/1/edit
    def edit
    end

    # POST /otrs_queues
    def create
      @otrs_queue = OtrsQueue.new(otrs_queue_params)

      @otrs_queue.save
      respond_with(@otrs_queue)
    end

    # PATCH/PUT /otrs_queues/1
    def update
      @otrs_queue.update(otrs_queue_params)
      respond_with(@otrs_queue)
    end

    # DELETE /otrs_queues/1
    def destroy
      @otrs_queue.destroy
      respond_with(@otrs_queue)
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_otrs_queue
        @otrs_queue = OtrsQueue.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def otrs_queue_params
        params.require(:otrs_queue).permit(:name, :otrs_queue_id)
      end
  end
end
