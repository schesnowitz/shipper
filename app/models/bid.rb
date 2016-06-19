class Bid < ActiveRecord::Base
    belongs_to :shipment
    belongs_to :user
end