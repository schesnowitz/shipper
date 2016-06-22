class ShipmentCategory < ActiveRecord::Base
  has_many :shipments 
end