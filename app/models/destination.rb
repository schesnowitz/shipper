class Destination < ActiveRecord::Base
    belongs_to :shipment
    belongs_to :user
    
    geocoded_by :destination_full_address, :latitude  => :destination_latitude, :longitude => :destination_longitude   # can also be an IP address
    after_validation :geocode          # auto-fetch coordinates
    
    
    def destination_full_address
      [destination_street_address, destination_state_provence, destination_city, destination_postal_code].join(", ")
    end
end