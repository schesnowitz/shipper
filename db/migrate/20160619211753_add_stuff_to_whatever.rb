class AddStuffToWhatever < ActiveRecord::Migration[5.0]
  def change
    add_reference :shipments, :user, index: true
    add_reference :bids, :user, index: true
  end
end
