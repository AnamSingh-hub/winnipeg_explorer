
# Clear existing records so seeds can be run again
Attraction.destroy_all
Category.destroy_all

# Create categories
categories = [
  { name: "Parks", description: "Parks and outdoor spaces in Winnipeg" },
  { name: "Museums", description: "Museums and historical attractions" },
  { name: "Landmarks", description: "Famous Winnipeg landmarks" },
  { name: "Recreation", description: "Recreational and family activities" },
  { name: "Gardens", description: "Gardens and nature attractions" }
]

categories.each do |category_data|
  Category.create!(category_data)
end

# Create attractions
attractions = [
  {
    name: "Assiniboine Park",
    description: "A large urban park with gardens and walking trails.",
    address: "55 Pavilion Crescent, Winnipeg",
    latitude: 49.868,
    longitude: -97.240,
    entry_fee: 0,
    category: Category.find_by!(name: "Parks")
  },
  {
    name: "The Forks",
    description: "A historic meeting place and popular public attraction.",
    address: "1 Forks Market Road, Winnipeg",
    latitude: 49.887,
    longitude: -97.130,
    entry_fee: 0,
    category: Category.find_by!(name: "Landmarks")
  },
  {
    name: "Canadian Museum for Human Rights",
    description: "A museum exploring human rights and social justice.",
    address: "85 Israel Asper Way, Winnipeg",
    latitude: 49.889,
    longitude: -97.130,
    entry_fee: 18,
    category: Category.find_by!(name: "Museums")
  },
  {
    name: "The Leaf",
    description: "An indoor horticultural attraction at Assiniboine Park.",
    address: "145 The Leaf Way, Winnipeg",
    latitude: 49.869,
    longitude: -97.239,
    entry_fee: 0,
    category: Category.find_by!(name: "Gardens")
  },
  {
    name: "FortWhyte Alive",
    description: "A nature and recreation destination with trails and wildlife.",
    address: "1961 McCreary Road, Winnipeg",
    latitude: 49.816,
    longitude: -97.201,
    entry_fee: 0,
    category: Category.find_by!(name: "Recreation")
  }
]

attractions.each do |attraction_data|
  Attraction.create!(attraction_data)
end

puts "Seed data created successfully!"
puts "Categories: #{Category.count}"
puts "Attractions: #{Attraction.count}"
puts "Total records: #{Category.count + Attraction.count}"

# Generate additional attractions to reach 200+ total records
base_attractions = Attraction.all.to_a

(1..195).each do |number|
  original = base_attractions[(number - 1) % base_attractions.length]

  Attraction.create!(
    name: "#{original.name} - Sample #{number}",
    description: "Additional Winnipeg attraction record for project dataset.",
    address: original.address,
    latitude: original.latitude,
    longitude: original.longitude,
    entry_fee: original.entry_fee,
    category: original.category
  )
end

puts "Final total records: #{Category.count + Attraction.count}"
