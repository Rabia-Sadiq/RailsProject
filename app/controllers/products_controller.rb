class ProductsController < ApplicationController
  COLOR_GROUPS = {
  "Olive" => "Green", "Light Olive" => "Green", "Pale Olive" => "Green", "Seafoam Green" => "Green", "Sage" => "Green",
  "Peach" => "Orange", "Coral" => "Orange", "Apricot" => "Orange", "Terracotta" => "Orange", "Papaya" => "Orange", "Peachy Pink" => "Orange", "Apricot Orange" => "Orange",
  "Mustard" => "Yellow", "Gold" => "Yellow", "Goldenrod" => "Yellow", "Amber" => "Yellow",
  "Rust" => "Brown", "Copper" => "Brown", "Bronze" => "Brown", "Caramel" => "Brown", "Warm Chocolate" => "Brown", "Chestnut" => "Brown", "Copper Brown" => "Brown", "Mocha" => "Brown", "Mushroom" => "Brown",
  "Tomato Red" => "Red", "Rustic Red" => "Red", "Warm Red" => "Red", "Maroon" => "Red", "Scarlet" => "Red", "Burgundy" => "Red", "Wine" => "Red",
  "Plum" => "Purple", "Lavender" => "Purple", "Warm Lavender" => "Purple", "Pale Mauve" => "Purple", "Lavender Mist" => "Purple", "Lilac" => "Purple", "Tanzanite" => "Purple",
  "Fuchsia" => "Pink", "Cool Pink" => "Pink", "Berry" => "Pink", "Rose" => "Pink", "Magenta" => "Pink", "Lilac Pink" => "Pink", "Cotton Candy" => "Pink", "Frosted Pink" => "Pink",
  "Emerald" => "Green", "Mint" => "Green", "Icy Mint" => "Green", "Soft Mint" => "Green",
  "Sky Blue" => "Blue", "Baby Blue" => "Blue", "Icy Blue" => "Blue", "Ice Blue" => "Blue", "Azure" => "Blue", "Cobalt" => "Blue", "Steel Blue" => "Blue", "Sapphire" => "Blue",
  "Charcoal" => "Gray", "Ash" => "Gray", "Slate Gray" => "Gray", "Cool Gray" => "Gray", "Pale Gray" => "Gray", "Pewter" => "Gray", "Stone" => "Gray", "Cement" => "Gray",
  "Ivory" => "White", "Soft White" => "White", "Cream" => "White", "Ivory Beige" => "White", "Seashell" => "White",
  "Taupe" => "Beige", "Warm Taupe" => "Beige", "Light Taupe" => "Beige", "Almond" => "Beige", "Wheat" => "Beige", "Sand" => "Beige", "Oatmeal" => "Beige", "Birch" => "Beige",
  "Slate Blue" => "Blue", "Teal" => "Blue", "Cool Teal" => "Blue", "Aqua" => "Blue",
  "Indigo" => "Blue", "Periwinkle" => "Blue",
  "Neutral Brown" => "Brown", "Heather" => "Brown", "Tawny" => "Brown",
  "Dusty Rose" => "Pink", "Dusty Coral" => "Orange", "Rose Beige" => "Pink",
  "Blush" => "Pink", "Pale Rose" => "Pink"
}



  def index
    if params[:color]
      clicked_color = params[:color].titleize
      search_color = clicked_color.downcase

      # Search for exact matches of the clicked color (e.g., "Sky Blue")
      exact_matches = Product.where("LOWER(color) = ?", search_color)
                             .or(Product.where("LOWER(description) LIKE ?", "%#{search_color}%"))
                             .or(Product.where("LOWER(title) LIKE ?", "%#{search_color}%"))

      # Fallback to the base color category if no exact match found
      base_color = COLOR_GROUPS[clicked_color] || clicked_color
      base_color_matches = Product.where("LOWER(color) LIKE ?", "%#{base_color.downcase}%")
                                   .or(Product.where("LOWER(description) LIKE ?", "%#{base_color.downcase}%"))
                                   .or(Product.where("LOWER(title) LIKE ?", "%#{base_color.downcase}%"))

      # Combine exact matches and base color matches
      if exact_matches.exists?
        # If exact matches are found, show them first, then base color matches
        @products = exact_matches.limit(100).or(base_color_matches.limit(100))
        @matched_color = clicked_color
      else
        # If no exact matches are found, only show the base color group
        @products = base_color_matches.limit(100)
        @matched_color = base_color
      end
    else
      @products = Product.limit(100)
      @matched_color = nil
    end
  end
end
