module Api
  module V1


    class EventVolounteersController < ApplicationController
        # before_action :authenticate_request!
      def index
        # binding.pry
        @event_volounteer = EventVolounteer.all
        render json: @event_volounteer
      end

      def show
        @event_volounteer = EventVolounteer.where(volounteer_id: event_volounteers_params[volounteer_id])
      end

      def update
      end

      def destroy
      end

      def create
        # binding.pry
        if validate_uniqueness
          @event_volounteer = EventVolounteer.create(event_volounteers_params)

          render json: @event_volounteer
        else
          render json: { errors: "this user already exists" }, status: :bad_request
       end
      end

      private

      def validate_uniqueness
        # binding.pry
        event = Event.find_by_id(params[:event_id])
        exists = event.event_volounteers.select do |volounteer|
          # binding.pry
          volounteer.volounteer_id == params[:volounteer_id]
        end
          if exists.empty?
            return true
          else
            return false
          end
      end

      def event_volounteers_params
        params.permit(:volounteer_id, :group_id, :event_id)
      end

  end
end
end
