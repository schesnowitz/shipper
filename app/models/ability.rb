class Ability < ActiveRecord::Base
    belongs_to :shipment
    belongs_to :rig 
end