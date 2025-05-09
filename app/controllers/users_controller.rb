class UsersController < ApplicationController
  before_action :authenticate_user!

  def palette
    @undertone = current_user.undertone

    @color_palette = case @undertone
    when "warm"
      {
        "Peach" => "#FFE5B4",
        "Coral" => "#FF7F50",
        "Mustard" => "#FFDB58",
        "Olive" => "#808000",
        "Gold" => "#FFD700",
        "Rust" => "#B7410E",
        "Terracotta" => "#E2725B",
        "Apricot" => "#FBCEB1",
        "Warm Beige" => "#F5F5DC",
        "Camel" => "#C19A6B",
        "Burnt Orange" => "#CC5500",
        "Bronze" => "#CD7F32",
        "Warm Red" => "#C21807",
        "Honey" => "#FFC30B",
        "Warm Taupe" => "#D2B1A3",
        "Sand" => "#C2B280",
        "Tomato Red" => "#FF6347",
        "Copper" => "#B87333",
        "Marigold" => "#FCC200",
        "Tan" => "#D2B48C",
        "Caramel" => "#C68E17",
        "Amber" => "#FFBF00",
        "Copper Brown" => "#6A3E2F",
        "Warm Chocolate" => "#3E2723",
        "Burgundy" => "#800020",
        "Chestnut" => "#964B00",
        "Apricot Orange" => "#FB8C00",
        "Rustic Red" => "#9C1C1C",
        "Cinnamon" => "#D2691E",
        "Papaya" => "#FF5722",
        "Peachy Pink" => "#FF9A8B",
        "Goldenrod" => "#DAA520",
        "Maroon" => "#800000",
        "Scarlet" => "#FF2400"
      }

    when "cool"
      {
        "Emerald" => "#50C878",
        "Sapphire" => "#0F52BA",
        "Lavender" => "#E6E6FA",
        "Cool Pink" => "#FFB6C1",
        "Fuchsia" => "#FF00FF",
        "Icy Blue" => "#B0E0E6",
        "Cool Gray" => "#8C92AC",
        "Plum" => "#8E4585",
        "Charcoal" => "#36454F",
        "Navy Blue" => "#000080",
        "Rose" => "#FF66CC",
        "Magenta" => "#FF00FF",
        "Cool Teal" => "#008080",
        "Icy Mint" => "#AAF0D1",
        "Berry" => "#990F4B",
        "Silver" => "#C0C0C0",
        "Baby Blue" => "#89CFF0",
        "Mauve" => "#E0B0FF",
        "Sky Blue" => "#87CEEB",
        "Wine" => "#722F37",
        "Seafoam Green" => "#2E8B57",
        "Turquoise" => "#40E0D0",
        "Ice Blue" => "#F0F8FF",
        "Lavender Mist" => "#D8BFD8",
        "Indigo" => "#4B0082",
        "Aqua" => "#00FFFF",
        "Steel Blue" => "#4682B4",
        "Lilac" => "#C8A2C8",
        "Periwinkle" => "#CCCCFF",
        "Cobalt" => "#0047AB",
        "Mint" => "#98FF98",
        "Lilac Pink" => "#D4A6C8",
        "Cotton Candy" => "#FFBCD9",
        "Azure" => "#007FFF",
        "Tanzanite" => "#8A2BE2",
        "Frosted Pink" => "#F1C6D7"
      }

    when "neutral"
      {
        "Blush" => "#F4C2C2",
        "Soft White" => "#F8F8FF",
        "Ivory" => "#FFFFF0",
        "Taupe" => "#B38B6D",
        "Rose Beige" => "#DDB7A0",
        "Warm Gray" => "#A89F91",
        "Dusty Rose" => "#DCAE96",
        "Soft Peach" => "#FFDAB9",
        "Light Olive" => "#BAB86C",
        "Teal" => "#008080",
        "Slate Blue" => "#6A5ACD",
        "Sage" => "#9DC183",
        "Mocha" => "#837060",
        "Mushroom" => "#B9A48C",
        "Warm Lavender" => "#C89FA3",
        "Ash" => "#B2BEB5",
        "Pale Mauve" => "#F6EAF4",
        "Dusty Coral" => "#D78D83",
        "Neutral Brown" => "#8B7355",
        "Cream" => "#FFFDD0",
        "Pewter" => "#99AABB",
        "Dusty Blue" => "#A6C1D1",
        "Stone" => "#D1D1D1",
        "Soft Mint" => "#A8E0D1",
        "Cement" => "#BFC1C2",
        "Linen" => "#FAF0E6",
        "Oatmeal" => "#D1C5A1",
        "Heather" => "#B3AFA2",
        "Pale Olive" => "#A3B18C",
        "Ivory Beige" => "#F0E6D2",
        "Almond" => "#D4B69D",
        "Wheat" => "#F5DEB3",
        "Seashell" => "#FFF5EE",
        "Slate Gray" => "#708090",
        "Pale Gray" => "#E8E8E8",
        "Khaki" => "#F0E68C",
        "Light Taupe" => "#B5A58D",
        "Birch" => "#E4D5B7",
        "Tawny" => "#CD853F",
        "Pale Rose" => "#FAD0C5"
      }

    else
      {}
    end
  end
  def favorites
    @favorites = current_user.favorite_colors
  end
end
