require 'csv'
require 'json'

# --- Optional: Helper to detect brand from name or link ---
# def detect_brand(name_or_link)
#   str = name_or_link.to_s.downcase
#   return 'Asim Jofa' if str.include?('asim jofa') || str.include?('aj')
#   return 'Bonanza Satrangi' if str.include?('bonanza')
#   return 'Khaadi' if str.include?('khaadi')
#   'Unknown'
# end

# --- Optional: Clean price value to ensure it's numeric ---
def clean_price(price_str)
  price_str.to_s.gsub(/[^\d]/, '').to_i # "PKR 1,680" => 1680
end

# --- Optional: Clear old data before importing (uncomment if needed) ---
# Product.destroy_all
# Product.where(brand: 'Khaadi').destroy_all
# Product.where(brand: 'Bonanza Satrangi').destroy_all

# --- Import from khaadi.csv ---
# khaadi_csv_path = Rails.root.join('db', 'khaadi.csv')

# CSV.foreach(khaadi_csv_path, headers: true, encoding: 'UTF-8') do |row|
#   begin
#     folder_name = row['Img Path'].to_s.split('\\').last
#     image_path = "/images/#{folder_name}/image_0.jpg"

#     Product.create!(
#       title: row['Product Description'],
#       description: row['Fabrics 3 Piece Suit'],
#       price: clean_price(row['Price']),
#       color: row['Color'],
#       brand: 'Khaadi',
#       link: row['Product Link'],
#       image_url: image_path
#     )
#   rescue => e
#     puts "❌ Failed to import row from khaadi.csv: #{e.message}"
#   end
# end

# puts "✅ Products from khaadi.csv imported!"

# --- Import from output2.csv ---
output_csv_path = Rails.root.join('db', 'dress.csv')

CSV.foreach(output_csv_path, headers: true, encoding: 'UTF-8') do |row|
  begin
    Product.create!(
      title: row['category'],
      price: clean_price("3,000"),
      color: "Not Available",
      image_url: row['image_url'],
      link: "",
      brand: "Rainbow Sapire"
    )
  rescue => e
    puts "❌ Failed to import row from output2.csv: #{e.message}"
  end
end

puts "✅ Products from output0.csv imported!"
