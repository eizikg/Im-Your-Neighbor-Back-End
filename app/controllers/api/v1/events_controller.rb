require 'pry'
module Api
  module V1

    class EventsController < ApplicationController
      # skip_before_action :authorized, only: [:create]
      before_action :authenticate_request!



      def index
        @event = Event.all

         render json: @event
      end


      def create
        # binding.pry
       @event = Event.create(event_params)
       if validate_admin && @event.save
         # binding.pry
         render json: @event
       else
         render json: { errors: "failed" }, status: :bad_request
       end
      end


      def update
        @event=Volounteer.find(params[:id])
        @event.update(event_params)
        if validate_admin && @event.save
          # binding.pry
          render json: @event
        else
          render json: { errors: "failed" }, status: :bad_request
        end
      end

      def show
        # binding.pry
        render json: Event.find(params[:id])
      end

      def destroy
        @event=Event.find(params[:id])
        @event.destroy
      end


    private

     def validate_admin
       # binding.pry
       current_group = Group.find(event_params[:group_id]).volounteers
       is_admin = current_group.select do |volounteer|
         volounteer.id == @current_user.id
       end
       binding.pry
       if !is_admin.empty?
         return is_admin[0].is_admin
       else
         return false
       end
     end

      def event_params
        params.permit(:description, :id, :active, :category_id, :group_id)
      end

    end
  end
end
