require 'csv'

namespace :csv do
  desc "Process and clean all CSV files in /csv_uploads and save to DB"
  task process_all: :environment do
    folder_path = Rails.root.join('csv_uploads')
    output_path = Rails.root.join('csv_cleaned')
    FileUtils.mkdir_p(output_path)

    brand_map = {
      "sapphire" => "Sapphire",
      "bonanza" => "Bonanza Satrangi",
      "gulahmed" => "GulAhmed",
      "alkaram" => "Alkaram Studio",
      "j." => "J.",
      "mariab" => "Maria B"
    }

    random_brands = brand_map.values.uniq
    random_names = ["Elegant Shirt", "Casual Kurti", "Chic Outfit", "Formal Wear"]
    random_prices = ["PKR 2,999", "PKR 3,450", "PKR 4,990", "PKR 5,250"]
    default_image = "https://example.com/placeholder.jpg"
    default_link = "https://example.com/product"

    brand_colors = {
      "Sapphire" => ["Blue", "Navy", "Turquoise"],
      "Bonanza Satrangi" => ["Red", "Pink", "Orange"],
      "GulAhmed" => ["Green", "Olive", "Beige"],
      "Alkaram Studio" => ["Purple", "Lavender", "Violet"],
      "J." => ["Black", "White", "Grey"],
      "Maria B" => ["Yellow", "Gold", "Mustard"]
    }

    Dir.glob("#{folder_path}/*.csv").each do |file_path|
      puts "Processing: #{file_path}"
      cleaned_rows = []

      CSV.foreach(file_path, headers: true) do |row|
        row = row.to_hash

        # Normalize keys case-insensitively
        name_key  = row.keys.find { |k| k.to_s.strip.downcase == "name" }
        price_key = row.keys.find { |k| k.to_s.strip.downcase == "price" }
        image_key = row.keys.find { |k| k.to_s.strip.downcase == "image" }
        link_key  = row.keys.find { |k| k.to_s.strip.downcase == "link" }
        color_key = row.keys.find { |k| k.to_s.strip.downcase == "color" }
        brand_key = row.keys.find { |k| k.to_s.strip.downcase == "brand" }

        # Fill missing values
        row[name_key]  = random_names.sample if name_key && row[name_key].to_s.strip.empty?
        row[price_key] = random_prices.sample if price_key && row[price_key].to_s.strip.empty?
        row[image_key] = default_image if image_key && row[image_key].to_s.strip.empty?
        row[link_key]  = default_link  if link_key && row[link_key].to_s.strip.empty?

        if color_key
          if row[color_key].to_s.strip.empty?
            brand = brand_key ? row[brand_key].to_s.strip : ""
            if brand_colors[brand] && !brand_colors[brand].empty?
              row[color_key] = brand_colors[brand].sample
            else
              row[color_key] = "Not Available"
            end
          end
        end

        if brand_key && row[brand_key].to_s.strip.empty?
          brand_found = nil
          image_url = image_key ? row[image_key].to_s.downcase : ""
          brand_map.each do |keyword, brand_name|
            if image_url.include?(keyword)
              brand_found = brand_name
              break
            end
          end
          row[brand_key] = brand_found || random_brands.sample
        end

        cleaned_rows << row

        # Save to database here - adjust model & attributes as needed
        Product.create!(
          title:  row[name_key],
          price: row[price_key],
          color: row[color_key],
          image_url: row[image_key],
          link:  row[link_key],
          brand: row[brand_key]
        )
      end

      # Save cleaned CSV
      cleaned_filename = "#{output_path}/#{File.basename(file_path, '.csv')}_cleaned.csv"
      CSV.open(cleaned_filename, "w") do |csv|
        if cleaned_rows.any?
          csv << cleaned_rows.first.keys
          cleaned_rows.each { |r| csv << r.values }
        else
          puts "Warning: No cleaned rows found for this file, skipping header writing."
          next
        end
      end

      puts "Cleaned file saved to: #{cleaned_filename}"
    end

    puts "✅ All CSVs processed, cleaned, and imported!"
  end
end
