class Shipment < ActiveRecord::Base
    has_many :bids
    belongs_to :shipment_category
    has_many :abilities
    has_many :rigs, through: :abilities
    belongs_to :user
    has_many :destinations, inverse_of: :shipment
    accepts_nested_attributes_for :destinations

    validates :name, presence: true
    
    geocoded_by :origin_full_address, :latitude  => :origin_latitude, :longitude => :origin_longitude   # can also be an IP address
    after_validation :geocode          # auto-fetch coordinates
    
    
    def origin_full_address
      [origin_street_address, origin_state_provence, origin_city, origin_postal_code].join(", ")
    end
    

  def self.search(params)
    shipments = Shipment.where("name like ? or description like?", "%#{params[:search]}%", "%#{params[:search]}%") if params[:search].present?
    shipments
  end
end