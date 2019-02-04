require 'pry'
module Api
  module V1


    class VolounteersController < ApplicationController
      # skip_before_action :authorized, only: [:create]
      # before_action :authenticate_request!
      # skip_before_action :authenticate_request!, only: [:create, :login]


      # def index
      #   # binding.pry
      #   volounteer = Volounteer.all
      #
      #    render json: volounteer
      # end

      def profile
        render json: { user: VolounteeerSerializer.new(current_user) }, status: :accepted
      end

      def create
        # binding.pry
       @user = Volounteer.create(user_params)
       if @user.save
         render json: {status: 'User created successfully'}, status: :created
       else
         render json: { errors: @user.errors.full_messages }, status: :bad_request
       end
      end


      def update
      end

      def show
        # binding.pry
        render json: Volounteer.find(params[:id])
      end

      def destroy
        @user=Volounteer.find(params[:id])
        @user.destroy
      end

      def login
        # binding.pry
        user = Volounteer.find_by(email: user_params[:email].to_s.downcase)

        if user && user.authenticate(user_params[:password])
            auth_token = JsonWebToken.encode({user_id: user.id})
            render json: {auth_token: auth_token}, status: :ok
        else
          render json: {error: 'Invalid username / password'}, status: :unauthorized
        end
      end

    private

      def user_params
        params.require(:user).permit(:email, :password, :username, :first_name, :last_name, :id)
      end

    end
  end
end
