require 'pry'
require 'chatkit'
module Api
  module V1


    class GroupVolounteersController < ApplicationController
        # before_action :authenticate_request!

      def create
        if validate_uniqueness
          group = Group.find(params[:group_id]).name
          volounteer = Volounteer.select(params[:volounteer_id]).email
          # chatkit = Chatkit::Client.new({
          #   instance_locator: 'v1:us1:411b0598-90f0-462c-9c5e-7700603c4122',
          #   key: 'dabd03b3-b4d0-472d-9ebd-df69eac61ef7:VgvPufaNN+RnU0216cU9eZX+TCLDHl1rzi0D+lmC3SA=',
          #   })
          @group_volounteer = GroupVolounteer.create(event_volounteers_params)
          render json: {data: @group_volounteer, new_join: true}
        else
          render json: {message: "this user already exists" }
        end

      end

      def update
        @group_volounteer = GroupVolounteer.where(params[:id])
        @group_volounteer.update(event_volounteers_params[:is_admin])
        render json: @group_volounteer
      end

      private

      def validate_uniqueness
        group = Group.find_by_id(params[:group_id])
        exists = group.group_volounteers.select do |volounteer|
          volounteer.volounteer_id == params[:volounteer_id]
        end
        if exists.empty?
          return true
        end
        false
      end

      def event_volounteers_params
        params.permit(:volounteer_id, :group_id, :is_admin)
      end


    end
  end
end
