module Api
  module V1

      class LocationsController < ApplicationController
        before_action :authenticate_request!

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

        #tested
        def groupsLocation
          geoLocation = [params[:location][:lat], params[:location][:lng]]
          # binding.pry
          if !@current_user.address
            binding.pry
          @current_user.update(lat: params[:location][:lat], lng: params[:location][:lng], address: params[:address], neighborhood: params[:neighborhood])
          end
          @groups = Group.within(5, :origin => geoLocation)
          render json: @groups
        end

      end

    end
  end
