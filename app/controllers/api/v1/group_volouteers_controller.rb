module Api
  module V1


    class GroupVolounteersController < ApplicationController
        before_action :authenticate_request!

      def create
       @group_volounteer = Event_volounteers.create(event_volounteers_params)
       render json: @group_volounteer
      end

      def update
        @group_volounteer = Event_volounteers.where(params[:id])
          @group_volounteer.update(event_volounteers_params[:is_admin])
          render json: @group_volounteer
      end

      private

      def event_volounteers_params
        params.permit(:volounteer_id, :group_id, :is_admin)
      end


    end
  end
end
