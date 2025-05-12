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
        "Apricot" => "#FBCEB1",
        "Burnt Orange" => "#CC5500",
        "Amber" => "#FFBF00",
        "Orange" => "#FFA500",
        "Tomato" => "#FF6347",
        "Pumpkin Orange" => "#FF7518",
        "Yellow" => "#FFFF00",
        "Deep Yellow" => "#FFD700",
        "Ochre" => "#CC7722",
        "Pistachio" => "#93C572",
        "Caramel" => "#C68E17",
        "Beige" => "#F5F5DC",
        "Warm Beige" => "#F5DEB3",
        "Lemon Yellow" => "#FFF700",
        "Camel" => "#C19A6B",
        "Marigold" => "#EAA221",
        "Tan" => "#D2B48C",
        "Anari" => "#DE3163",
        "Scarlet" => "#FF2400",
        "Candy" => "#FFB6C1",
        "Papaya" => "#FFDAB9",
        "Mango" => "#FFC324",
        "Peachy" => "#FFDAB9",
        "Golden" => "#FFD700",
        "Chrome" => "#FFA700",
        "Ferozi" => "#00CED1"
      }

    when "cool"
      {
        "Lavender" => "#E6E6FA",
        "Fuchsia" => "#FF00FF",
        "Plum" => "#8E4585",
        "Purple" => "#800080",
        "Lilac" => "#C8A2C8",
        "Sky Blue" => "#87CEEB",
        "Ice Blue" => "#F0F8FF",
        "Navy" => "#000080",
        "Navy Blue" => "#000080",
        "Teal" => "#008080",
        "Cool Gray" => "#8C92AC",
        "Emerald" => "#50C878",
        "Mint" => "#98FF98",
        "Sea Green" => "#2E8B57",
        "Seafoam" => "#9FE2BF",
        "Mauve" => "#E0B0FF",
        "Cool Pink" => "#FFB6C1",
        "Sapphire" => "#0F52BA",
        "Blue" => "#0000FF",
        "Aqua" => "#00FFFF",
        "Turquoise" => "#40E0D0",
        "Lime Green" => "#32CD32",
        "Baby Blue" => "#89CFF0",
        "Rose" => "#FF66CC",
        "Magenta" => "#FF00FF",
        "Light Pink" => "#FFB6C1",
        "Pearl" => "#EAE0C8",
        "Steel" => "#4682B4",
        "Frosted Pink" => "#F1C6D7",
        "Parrot Green" => "#96C957",
        "Light Blue" => "#ADD8E6",
        "D-GREEN" => "#006400"
      }

    when "neutral"
      {
        "Ivory" => "#FFFFF0",
        "Off White" => "#FAF9F6",
        "Off-White" => "#FAF9F6",
        "Cream" => "#FFFDD0",
        "Khaki" => "#F0E68C",
        "Mushroom" => "#B9A48C",
        "Beige" => "#F5F5DC",
        "Warm Gray" => "#A89F91",
        "Ash" => "#B2BEB5",
        "Mocha" => "#837060",
        "Coffee" => "#6F4E37",
        "Stone" => "#D1D1D1",
        "Oatmeal" => "#D1C5A1",
        "Pale Olive" => "#A3B18C",
        "Dusty Blue" => "#A6C1D1",
        "Slate Gray" => "#708090",
        "Birch" => "#E4D5B7",
        "BROWN" => "#8B4513",
        "Blush" => "#F4C2C2",
        "Soft White" => "#F8F8FF",
        "White" => "#FFFFFF",
        "Grey" => "#808080",
        "Gray" => "#808080",
        "Neutral Brown" => "#8B7355",
        "Pewter" => "#99AABB",
        "Light Taupe" => "#B5A58D",
        "Almond" => "#D4B69D",
        "Skin" => "#FFDAB9",
        "Cement" => "#BFC1C2",
        "Soft Peach" => "#FFDAB9",
        "Heather" => "#B3AFA2",
        "Taupe" => "#B38B6D",
        "Linen" => "#FAF0E6",
        "Raw Silk" => "#FDF6E3",
        "Poly Silk" => "#FDF6E3",
        "Poly Net" => "#FDF6E3",
        "Patchwork" => "#C0C0C0"
      }

    else
      {}
    end
  end

  def favorites
    @favorites = current_user.favorite_colors
  end
end
