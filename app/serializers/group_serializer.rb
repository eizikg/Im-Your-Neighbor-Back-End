class GroupSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :volounteers, :events, :volounteers_count, :room_id, :neighborhood
  # has_many :group_volounteers , serializer: GroupVolounteerSerializer
  # has_many :events, serializer: EventSerializer

  # def volounteers
  #   self.object.volounteers.map do |volounteer|
  #     {first_name: volounteer.first_name,
  #      id: volounteer.id,
  #      last_name: volounteer.last_name,
  #      username: volounteer.username,
  #      is_admin: volounteer.group_volounteers.where(group_id: self.object.id)[0].is_admin
  #    }
  #    end
  #  end
  def volounteers_count
   self.object.volounteers.count
  end

   def volounteers
     group_id = self.object.id
     sql = <<-SQL
        SELECT first_name, last_name, email, is_admin
        FROM group_volounteers
        INNER JOIN volounteers
        ON group_volounteers.volounteer_id = volounteers.id
        WHERE group_id = #{group_id}
        SQL
      @volounteer = Volounteer.find_by_sql(sql)
    end


   def events
     self.object.events.where(active: true)
   end


end
