freight = ShipmentCategory.where(name: "Freight").first_or_create(name: "Freight")
household_goods = ShipmentCategory.where(name: "Household Goods").first_or_create(name: "Household Goods")
office = ShipmentCategory.where(name: "Office Goods").first_or_create(name: "Office Goods")
heavy_equipment = ShipmentCategory.where(name: "Heavy Equipment").first_or_create(name: "Heavy Equipment")
vehicles = ShipmentCategory.where(name: "Vehicles").first_or_create(name: "Vehicles")
animals = ShipmentCategory.where(name: "Animals").first_or_create(name: "Animals")

100.times do
user = User.create(email: Faker::Internet.email, password: "password", password_confirmation: "password") 
puts user.inspect
end

1000.times do
shipment = Shipment.create(name: Faker::StarWars.quote, 
                 description: Faker::Lorem.paragraph,
                      budget: rand(100..5000),
                    location: Faker::Address.city,
        shipment_category_id: rand(1..6),
                     user_id: rand(1..100))
puts shipment.inspect
end


         
         


