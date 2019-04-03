require 'pry'
module Api
  module V1

    class EventsController < ApplicationController
      # skip_before_action :authorized, only: [:create]
      before_action :authenticate_request!, only: [:update]



      def index
        @event = Event.all
        render json: @event
      end


      def create
        @event = Event.create(event_params)
         if @event.save
           render json: @event
         else
           render json: { errors: "failed" }, status: :bad_request
         end
      end


      def update
        @event=Event.find(params[:id])
        @event.update(event_params)
        if validate_admin && @event.save
          render json: @event
        else
          render json: { errors: "failed" }, status: :bad_request
        end
      end

      def show
        render json: Event.find(params[:id])
      end

      def destroy
        @event=Event.find(params[:id])
        @event.destroy
      end


    private

     def validate_admin
       current_group = Group.find(event_params[:group_id]).volounteers
       is_admin = current_group.find do |volounteer|
         volounteer.id == @current_user.id
       end
       if !is_admin.empty?
         return true
       end
       false
     end

      def event_params
        params.permit(:description, :id, :active, :category_id, :group_id, :address, :lng, :lat, :volounteers_required)
      end

    end
  end
end
