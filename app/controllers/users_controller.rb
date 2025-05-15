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
        "Pistachio" => "#93C572",
        "Beige" => "#F5F5DC",
        "Lime Yellow" => "#EFFF00",
        "Golden" => "#FFD700",
        "Brown" => "#8B4513",
        "Coffee" => "#6F4E37",
        "Tan" => "#D2B48C",
        "Anari" => "#DE3163",
        "Dull Yellow" => "#EEDD82",
        "Chrome" => "#FFA700",
        "Peachy Pink" => "#FFDAB9",
        "Tea Rose" => "#F4C2C2",
        "L-GREEN" => "#B7D7A8",
        "Yellow Ochre" => "#C9AE5D"
      }

    when "cool"
      {
        "Turquoise" => "#40E0D0",
        "Fuchsia" => "#FF00FF",
        "Fushia Pink" => "#FF00FF",
        "Lilac" => "#C8A2C8",
        "Lavender" => "#E6E6FA",
        "Purple" => "#800080",
        "Blue" => "#0000FF",
        "Sky Blue" => "#87CEEB",
        "Ice Blue" => "#F0F8FF",
        "Teal" => "#008080",
        "Teal Green" => "#00827F",
        "Emerald Green" => "#50C878",
        "Mint Green" => "#98FF98",
        "Sea Green" => "#2E8B57",
        "Magenta" => "#FF00FF",
        "Rose" => "#FF66CC",
        "Royal Blue" => "#4169E1",
        "Bubble Pink" => "#F6D1D1",
        "Powder Pink" => "#FFB6C1",
        "Shocking Pink" => "#FC0FC0",
        "Candy Purple" => "#A020F0",
        "Parrot Green" => "#96C957",
        "Ferozi" => "#00CED1",
        "Aqua" => "#00FFFF",
        "Aqua Green" => "#00FFCC",
        "Coral" => "#FF7F50",
        "Plum" => "#8E4585",
        "Mauve" => "#E0B0FF",
        "Mulberry" => "#70193D",
        "Dark Blue" => "#00008B",
        "Purplish Blue" => "#6A5ACD",
        "Dark Turquoise" => "#00CED1",
        "D-GREEN" => "#006400",
        "Greyish Blue" => "#A6A6D1",
        "Navy Blue" => "#000080",
        "NAVY" => "#000080",
        "navy" => "#000080"
      }

    when "neutral"
      {
        "Ivory" => "#FFFFF0",
        "Off-White" => "#FAF9F6",
        "Cream" => "#FFFDD0",
        "White" => "#FFFFFF",
        "Skin" => "#FFDAB9",
        "Blush Pink" => "#F4C2C2",
        "Light Grey" => "#D3D3D3",
        "Grey" => "#808080",
        "Light Beige" => "#F5F5DC",
        "Ecru" => "#C2B280",
        "Mouse" => "#A9A9A9",
        "BROWN" => "#8B4513",
        "Pink" => "#FFC0CB",
        "pink" => "#FFC0CB",
        "Light Pink" => "#FFB6C1",
        "Light" => "#DCDCDC",
        "Beige and Purple" => "#F5F5DC", # averaged beige tone
        "biege" => "#F5F5DC",
        "cream" => "#FFFDD0",
        "Dull Pink" => "#D89AA6",
        "Pale Lilac" => "#DCD0FF",
        "Light Tea Pink" => "#F6E2D3",
        "Peyote" => "#DDD6C3",
        "Steel Grey" => "#4682B4",
        "Green" => "#008000",
        "green" => "#008000",
        "Apple Green" => "#8DB600",
        "Olive Green" => "#708238",
        "Deep Green" => "#056608",
        "Dark Green" => "#013220",
        "Olive" => "#808000",
        "Army Green" => "#4B5320"
      }

    else
      {}
    end
  end
end
