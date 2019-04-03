require 'pry'
require 'chatkit'



module Api
  module V1


    class VolounteersController < ApplicationController
      before_action :authenticate_request!
      skip_before_action :authenticate_request!, only: [:create, :login]

      def profile
        render json: Volounteer.find(@current_user.id)
      end

      def create
       @user = Volounteer.create(user_params)
       if @user.save
         chatkit = Chatkit::Client.new({
           instance_locator: 'v1:us1:411b0598-90f0-462c-9c5e-7700603c4122',
           key: 'dabd03b3-b4d0-472d-9ebd-df69eac61ef7:VgvPufaNN+RnU0216cU9eZX+TCLDHl1rzi0D+lmC3SA=',
          })
          chatkit.create_user({ id: @user.email, name: "#{@user.first_name} #{@user.last_name}" })
          user_data = VolounteerSerializer.new(@user)
          auth_token = JsonWebToken.encode({user_id: @user.id})
          render json: {user: user_data, auth_token: auth_token}
       else
         render json: { errors: @user.errors.full_messages }, status: :bad_request
       end
      end


      def update
        volounteer = Volounteer.find(params[:id])
        updated = volounteer.update(user_params)
        render json: updated
      end

      def show
        render json: Volounteer.find(params[:id])
      end

      def destroy
        @user=Volounteer.find(params[:id])
        @user.destroy
      end

      def login
        @user = Volounteer.find_by(email: user_params[:email].to_s.downcase)
        user_data = VolounteerSerializer.new(@user)
        if @user && @user.authenticate(user_params[:password])
          auth_token = JsonWebToken.encode({user_id: @user.id})
          render json: {user: user_data, auth_token: auth_token}, status: :ok
        else
          render json: {error: 'Invalid username / password'}, status: :unauthorized
        end
      end

    private

      def user_params
        params.permit(:email, :password, :username, :first_name, :last_name, :lat, :lng, :id, :neighborhood)
      end

    end
  end
end
