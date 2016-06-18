class Rig < ActiveRecord::Base
    has_many :abilities
    has_many :shipments, through: :abilities
end