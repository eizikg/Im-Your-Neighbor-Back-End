module Api
  module V1

    class EventsController < ApplicationController

      def index
         render json: Event.all
      end

      def create
      end

      def update
      end

      def show

      end

      def destroy
      end

    end
  end
end 
