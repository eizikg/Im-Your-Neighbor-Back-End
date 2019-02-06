require 'pry'
module Api
  module V1

    class GroupsController < ApplicationController
      # skip_before_action :authorized, only: [:create]
      before_action :authenticate_request!
      skip_before_action :authenticate_request!, only: [:index, :create]

      def index
        @group=Group.all
         render json: Group.all, each_serializer: GroupAllSerializer
      end

      def create
        @group= Group.create(group_params[:description], group_params[:category_id])
        Group_volounteers.create(group_id: @group, volounteer_id: group_params[:volounteer_id], is_admin: true)
        render json: @group
      end

      def update
        @group=Group.find(params[:id])
        @group.update(group_params)
        render json: @group
      end

      def show
       render json: Group.where(id: params["id"]), each_serializer: GroupSerializer
      end

      def destroy
        @group=Group.find(params[:id])
        render json: @group.destroy
      end

      private

        def group_params
          params.require(:group).permit(:id, :description, :category_id, :volounteer_id)
        end

    end
  end
end
