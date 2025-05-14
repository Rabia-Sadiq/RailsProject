
class UsersController < ApplicationController
  before_action :authenticate_user!

 def palette
  @undertone = current_user.undertone

  @color_palette = case @undertone
  when "warm"
    {
      "Peach" => "#FFDAB9",
      "Orange" => "#FFA500",
      "Mustard" => "#FFDB58",
      "Olive" => "#808000",
      "Gold" => "#FFD700",
      "Rust" => "#B7410E",
      "Yellow" => "#FFFF00",
      "Lemon Yellow" => "#FFF700",
      "Pistachio" => "#93C572",
      "Carrot Orange" => "#ED9121",
      "Mango Orange" => "#FF8243",
      "Pumpkin Orange" => "#FF7518",
      "Apricot" => "#FBCEB1",
      "Beige" => "#F5F5DC",
      "Lime Yellow" => "#EFFF00",
      "Golden" => "#FFD700",
      "Brown" => "#8B4513",
      "Coffee" => "#6F4E37",
      "Camel" => "#C19A6B",
      "Tan" => "#D2B48C",
      "Anari" => "#DE3163",
      "Dull Yellow" => "#EEDD82",
      "Chrome" => "#FFA700",
      "Papaya" => "#FFDAB9",
      "Peachy Pink" => "#FFDAB9"
    }

  when "cool"
    {
      "Turquoise" => "#40E0D0",
      "Fuchsia" => "#FF00FF",
      "Lilac" => "#C8A2C8",
      "Lavender" => "#E6E6FA",
      "Navy Blue" => "#000080",
      "Navy" => "#000080",
      "Purple" => "#800080",
      "Blue" => "#0000FF",
      "Sky Blue" => "#87CEEB",
      "Ice Blue" => "#F0F8FF",
      "Teal" => "#008080",
      "Emerald Green" => "#50C878",
      "Mint Green" => "#98FF98",
      "Sea Green" => "#2E8B57",
      "Magenta" => "#FF00FF",
      "Rose" => "#FF66CC",
      "Light Blue" => "#ADD8E6",
      "Lime Green" => "#32CD32",
      "Parrot Green" => "#96C957",
      "Ferozi" => "#00CED1",
      "Aqua" => "#00FFFF",
      "Coral" => "#FF7F50",
      "Plum" => "#8E4585",
      "Mauve" => "#E0B0FF",
      "Mulberry" => "#70193D",
      "Royal Blue" => "#4169E1",
      "Bubble Pink" => "#F6D1D1",
      "Powder Pink" => "#FFB6C1",
      "Shocking Pink" => "#FC0FC0",
      "Candy Purple" => "#A020F0",
      "D-GREEN" => "#006400",
      "Steel Grey" => "#4682B4",
      "Dark Turquoise" => "#00CED1"
    }

  when "neutral"
    {
      "Ivory" => "#FFFFF0",
      "Off-White" => "#FAF9F6",
      "Cream" => "#FFFDD0",
      "White" => "#FFFFFF",
      "Grey" => "#808080",
      "Gray" => "#808080",
      "Mushroom" => "#B9A48C",
      "Khaki" => "#F0E68C",
      "Stone" => "#D1D1D1",
      "Coffee" => "#6F4E37",
      "Taupe" => "#B38B6D",
      "Skin" => "#FFDAB9",
      "Raw Silk" => "#FDF6E3",
      "Poly Silk" => "#FDF6E3",
      "Poly Net" => "#FDF6E3",
      "Blush Pink" => "#F4C2C2",
      "Light Grey" => "#D3D3D3",
      "Light Beige" => "#F5F5DC",
      "Ecru" => "#C2B280",
      "Mouse" => "#A9A9A9",
      "Heather" => "#B3AFA2",
      "Pewter" => "#99AABB",
      "Light Taupe" => "#B5A58D",
      "Soft White" => "#F8F8FF",
      "Neutral Brown" => "#8B7355",
      "Light" => "#DCDCDC",
      "Off White" => "#FAF9F6",
      "BROWN" => "#8B4513",
      "biege" => "#F5F5DC",
      "cream" => "#FFFDD0",
      "Greyish Blue" => "#A6A6D1"
    }

  else
    {}
  end
 end
end
