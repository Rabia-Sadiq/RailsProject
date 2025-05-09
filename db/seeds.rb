# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'csv'
require 'json'

# --- Import from khaadi.csv ---


csv_path = Rails.root.join('db', 'khaadi.csv')

CSV.foreach(csv_path, headers: true) do |row|
  folder_name = row['Img Path'].split('\\').last # gets 'ALK231009'

  image_path = "/images/#{folder_name}/image_0.jpg"

  Product.create!(
    title: row['Product Description'],
    description: row['Fabrics 3 Piece Suit'], # adjust if needed
    price: row['Price'],
    color: row['Color'],
    brand: "Khaadi",
    link: row['Product Link'],
    image_url: image_path
  )
end

puts "✅ Products with images imported!"


# --- Import from hm.csv ---
puts "Importing H&M products..."
CSV.foreach(Rails.root.join("db/hm.csv"), headers: true) do |row|
  image_json = JSON.parse(row["image"].gsub("'", '"')) rescue []
  image_url = "https:#{image_json[0]["src"]}" if image_json.any?

  Product.create!(
    title: row["title"],
    description: row["sellingAttribute"],
    price: row["price"],
    color: row["color"] || "Unknown",
    image_url: image_url,
    brand: row["brandName"],
    link: row["link"]
  )
end

# --- Import from custom.csv ---
puts "Importing long products..."
CSV.foreach(Rails.root.join("db/long.csv"), headers: true) do |row|
  Product.create!(
    title: row["Product_Name"],
    description: row["Details"],
    price: row["Price"],
    color: "Unknown",
    image_url: row["Product_Image"],
    brand: "Unknown",
    link: row["Link"]
  )
end
puts "Importing shirts products..."
CSV.foreach(Rails.root.join("db/SHIRTS.csv"), headers: true) do |row|
  Product.create!(
    title: row["Product_Name"],
    description: row["Details"],
    price: row["Price"],
    color: "Unknown",
    image_url: row["Product_Image"],
    brand: "Zara",
    link: row["Link"]
  )
end
puts "✅ All products imported!"
