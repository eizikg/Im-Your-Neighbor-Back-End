require 'pry'
module Api
  module V1


    class GroupVolounteersController < ApplicationController
        # before_action :authenticate_request!

      def create
        binding.pry
        if validate_uniqueness
          @group_volounteer = GroupVolounteer.create(event_volounteers_params)
          render json: @group_volounteer
        else
          render json: { errors: "this user already exists" }, status: :bad_request
        end

      end

      def update
        @group_volounteer = GroupVolounteer.where(params[:id])
          @group_volounteer.update(event_volounteers_params[:is_admin])
          render json: @group_volounteer
      end

      private

      def validate_uniqueness
        # binding.pry
        group = Group.find_by_id(params[:group_id])
        exists = group.group_volounteers.select do |volounteer|
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
        params.permit(:volounteer_id, :group_id, :is_admin)
      end


    end
  end
end
