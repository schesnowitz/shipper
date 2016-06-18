class InitSchema < ActiveRecord::Migration[5.0]
  def change
    
    create_table :shipments do |t|
      t.string :name
      t.text :description
      t.integer :budget
      t.string :location
      t.boolean :open_for_bids, default: true
      t.integer :winning_bid
      t.timestamps
    end
    
    create_table :shipment_categories do |t|
      t.string :name
    end
    
    create_table :rigs do |t|
      t.string :equipment
    end
    
    create_table :bids do |t|
      t.integer :bid
      t.text :description
      t.timestamps
    end
    
    create_table :abilities do |t|
    end
    
    add_reference :shipments, :shipment_categories, index: true
    add_reference :bids, :shipments, index: true
    add_reference :abilities, :shipments, index: true
    add_reference :shipments, :rigs, index: true
    
  end
end
