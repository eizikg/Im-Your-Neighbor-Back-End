module Api
  module V1

      class LocationsController < ApplicationController

        def volounteers
          # binding.pry
          @volounteer = Volounteer.find(request.headers['User'].to_s)
          range = request.headers['Range'].to_i
          geolocation = request.headers['GeoLocation'].split(",")
          @volounteer.update(lat: geolocation[0], lng: geolocation[1])
          @volounteers = Volounteer.within(range, :origin => geolocation)
          # binding.pry
          render json: @volounteers
        end

        def groups
          # binding.pry
          @volounteer = Volounteer.find(request.headers['User'].to_s)
          range = request.headers['Range'].to_i
          geolocation = request.headers['GeoLocation'].split(",")
          @volounteer.update(lat: geolocation[0], lng: geolocation[1])
          @groups = Group.within(range, :origin => geolocation)
          # binding.pry
          render json: @groups
        end

      end

    end
  end
