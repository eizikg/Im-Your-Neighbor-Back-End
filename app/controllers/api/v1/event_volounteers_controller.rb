module Api
  module V1


    class EventVolounteersController < ApplicationController
        # before_action :authenticate_request!

      def index
        @event_volounteer = EventVolounteer.all
        render json: @event_volounteer
      end

      def create
        if validate_uniqueness
          @event_volounteer = EventVolounteer.create(event_volounteers_params)
           if @event_volounteer.save
             render json: @event_volounteer
           else
             render json: { errors: "not saved" }, status: :bad_request
           end
        else
          render json: { errors: "this user already exists" }, status: :bad_request
       end
      end

      private

      def validate_uniqueness
        event = Event.find_by_id(params[:event_id])
        exists = event.event_volounteers.select do |volounteer|
          volounteer.volounteer_id == params[:volounteer_id]
        end
        if exists.empty?
          return true
        end
        false
      end

      def event_volounteers_params
        params.permit(:volounteer_id, :group_id, :event_id)
      end

  end
end
end
