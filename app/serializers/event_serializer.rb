require 'pry'
class EventSerializer < ActiveModel::Serializer
  attributes :id, :description, :group_id, :volounteers, :volounteers_required, :count, :created_at, :address

  def  volounteers
     @event_volounteers = self.object.event_volounteers
     volounteers = Volounteer.where(id: @event_volounteers.map do |event_volounteer|
       event_volounteer.volounteer_id
     end)


      volounteers.map do |volounteer|
      {
       id: volounteer.id,
       first_name: volounteer.first_name,
       last_name: volounteer.last_name
      }
    end
  end

   def required
     required = self.object.volounteers_required
       required.to_i
   end

   def count
     @event_volounteers.length
   end
  end
