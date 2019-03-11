require 'pry'
require 'chatkit'
module Api
  module V1

    class GroupsController < ApplicationController
      # skip_before_action :authorized, only: [:create]
      before_action :authenticate_request!
      skip_before_action :authenticate_request!, only: [:index, :create, :show]

      def index
        @group=Group.all
         render json: Group.all, each_serializer: GroupAllSerializer
      end

      def create
        @volounteer = Volounteer.find(params[:volounteer_id])
        new_params = group_params
        new_params['lat']=@volounteer.lat
        new_params['lng']=@volounteer.lng
        new_params['neighborhood']=@volounteer.neighborhood
        @group= Group.create(new_params)
        # binding.pry
        if @group.save
        chatkit = Chatkit::Client.new({
          instance_locator: 'v1:us1:411b0598-90f0-462c-9c5e-7700603c4122',
          key: 'dabd03b3-b4d0-472d-9ebd-df69eac61ef7:VgvPufaNN+RnU0216cU9eZX+TCLDHl1rzi0D+lmC3SA=',
          })
        # create new chatkit room
         newRoom = chatkit.create_room({
          creator_id: @volounteer.email,
          name: @group.name,
          private: false
          })
          # binding.pry
        @group.update(room_id: newRoom[:body][:id])
        GroupVolounteer.create(group_id: @group.id, volounteer_id: params[:volounteer_id], is_admin: true)
          render json: @group, serializer: GroupAllSerializer
        else
          render json: { errors: @group.errors.full_messages }, status: :bad_request
      end
    end

      def update
        @group=Group.find(params[:id])
        @group.update(group_params)
        render json: @group
      end

      def show
        # binding.pry
       @groups = Group.where(id: params["id"])
       render json: @groups, each_serializer: GroupSerializer
       # Group.where(id: params["id"], joins: [GroupVolounteer, Volounteer])
      end

      def destroy
        @group=Group.find(params[:id])
        render json: @group.destroy
      end

      private

        def group_params
          params.permit(:id, :description, :name, :category_id, :neighborhood, :address)
        end

    end
  end
end
