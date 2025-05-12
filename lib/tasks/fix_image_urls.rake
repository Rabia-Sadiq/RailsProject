namespace :products do
  desc "Fix malformed image_url fields"
  task fix_image_urls: :environment do
    require 'json'

    Product.where("image_url LIKE '%[{%'").find_each do |product|
      begin
        json = JSON.parse(product.image_url.gsub("'", '"'))
        if json.is_a?(Array) && json.first["src"]
          product.update(image_url: "https:#{json.first["src"]}")
          puts "✅ Fixed: #{product.id}"
        end
      rescue JSON::ParserError => e
        puts "❌ Skipped #{product.id} - #{e.message}"
        product.update(image_url: nil)
      end
    end
    puts "✅ Done fixing product images."
  end
end
