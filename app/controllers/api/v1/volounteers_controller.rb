require 'pry'
module Api
  module V1

    class VolounteersController < ApplicationController
      skip_before_action :authorized, only: [:create]

      def index
         render json: Volounteer.all
      end

      def profile
    render json: { user: VolounteeerSerializer.new(current_user) }, status: :accepted
  end

      def create
     @user = Volounteer.create(user_params)
     if @user.valid?
       @token = encode_token(user_id: @user.id)
       render json: { user: VolounteerSerializer.new(@user), jwt: @token }, status: :created
     else
       render json: { error: 'failed to create user' }, status: :not_acceptable
     end
 end


      def update
      end

      def show
        binding.pry
        render json: Volounteer.find(id: user_params[:id])
      end

      def destroy
      end

    private

      def user_params
        params.require(:user).permit(:username, :password)
      end

    end
  end
end
