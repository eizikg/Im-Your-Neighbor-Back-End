module Api
  module V1

    class EventsController < ApplicationController
      # skip_before_action :authorized, only: [:create]
      # before_action :authenticate_request!


      def index
        event = Event.all

         render json: event
      end


      def create
        # binding.pry
       @event = Event.create(user_params)
       if @event.save
         render json: {status: 'User created successfully'}, status: :created
       else
         render json: { errors: @user.errors.full_messages }, status: :bad_request
       end
      end


      def update
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

      def user_params
        params.require(:user).permit(:email, :password, :username, :first_name, :last_name, :id)
      end

    end
  end
end
