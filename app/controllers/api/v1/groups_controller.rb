require 'pry'
module Api
  module V1

    class GroupsController < ApplicationController
      # skip_before_action :authorized, only: [:create]

      def index
        @group=Group.all
         render json: Group.all, each_serializer: GroupAllSerializer
      end

      def create
      end

      def update
        @user=Volounteer.find(params[:id])
        @user.update(group_params)
      end

      def show
       render json: Group.where(id: params["id"]), each_serializer: GroupSerializer
      end

      def destroy
      end

      private

        def group_params
          params.require(:group).permit(:id, :description, :category_id)
        end

    end
  end
end
