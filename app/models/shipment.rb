class Shipment < ActiveRecord::Base
    has_many :bids
    belongs_to :shipment_category
    has_many :abilities
    has_many :rigs, through: :abilities
end