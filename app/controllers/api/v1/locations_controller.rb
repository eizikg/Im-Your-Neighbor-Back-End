require 'json'
module Api
  module V1

      class LocationsController < ApplicationController

        def volounteers
          # binding.pry
          range = request.headers['Range'].to_i
          # geolocation = JSON.parse(request.headers['GeoLocation'])
          geolocation = request.headers['GeoLocation'].split(",")
          # binding.pry
          @volounteers = Volounteer.within(range, :origin => geolocation)
          render json: @volounteers
        end

        def groups
          range = request.headers['Range'].to_i
          geolocation = JSON.parse(request.headers['GeoLocation'])
          @groups = Group.within(range, :origin => geolocation)
          render json: @groups
        end

      end

    end
  end
