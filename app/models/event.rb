class Event < ApplicationRecord
  has_many :event_providers
  has_many :providers, :through => :event_providers
end
