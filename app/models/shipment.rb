class Shipment < ActiveRecord::Base
    has_many :bids
    belongs_to :shipment_category
    has_many :abilities
    has_many :rigs, through: :abilities
    belongs_to :user
    validates :name, presence: true
    
  def self.search(params)
    shipments = Shipment.where("name like ? or description like?", "%#{params[:search]}%", "%#{params[:search]}%") if params[:search].present?
    shipments
  end

end