require 'pry'
class EventSerializer < ActiveModel::Serializer
  attributes :id, :description, :group_id, :volounteers, :required, :count

  def  volounteers
    # binding.pry
      self.object.event_volounteers.map do |event_volounteer|
        volounteer= Volounteer.find_by_id(event_volounteer.volounteer_id)
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
     self.object.event_volounteers.count
   end
  end
