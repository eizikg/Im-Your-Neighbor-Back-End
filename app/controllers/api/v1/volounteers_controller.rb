require 'pry'
module Api
  module V1

    class VolounteersController < ApplicationController

      def index
         render json: Volounteer.all
      end

      def create
      end

      def update
      end

      def show
        binding.pry
        render json: Volounteer.find(id: params[:id])
      end

      def destroy
      end
    end
  end
end
