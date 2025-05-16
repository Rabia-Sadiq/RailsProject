class UsersController < ApplicationController
  before_action :authenticate_user!

  def palette
    @undertone = current_user.undertone

    @color_palette = case @undertone
    when "warm"
      {
        "Orange" => "#FFA500",
        "Pistachio" => "#93C572",
        "Mustard" => "#FFDB58",
        "Peach" => "#FFDAB9",
        "Coffee" => "#6F4E37",
        "Brown" => "#8B4513",
        "Rust" => "#B7410E",
        "Lime Yellow" => "#EFFF00",
        "Yellow" => "#FFFF00",
        "Golden" => "#FFD700",
        "Tan" => "#D2B48C",
        "Mango Orange" => "#FF8243",
        "Carrot Orange" => "#ED9121",
        "Anari" => "#DE3163",
        "Chrome" => "#FFA700",
        "Yellow Ochre" => "#C9AE5D",
        "L-GREEN" => "#B7D7A8",
        "Apple Green" => "#8DB600",
        "Tea Rose" => "#F4C2C2",
        "Pumpkin Orange" => "#FF7518"
      }

    when "cool"
      {
        "Turquoise" => "#40E0D0",
        "Fuchsia" => "#FF00FF",
        "Lilac" => "#C8A2C8",
        "Lavender" => "#E6E6FA",
        "Purple" => "#800080",
        "Sky Blue" => "#87CEEB",
        "Ice Blue" => "#F0F8FF",
        "Teal" => "#008080",
        "Mint Green" => "#98FF98",
        "Sea Green" => "#2E8B57",
        "Royal Blue" => "#4169E1",
        "Bubble Pink" => "#F6D1D1",
        "Powder Pink" => "#FFB6C1",
        "Shocking Pink" => "#FC0FC0",
        "Candy Purple" => "#A020F0",
        "Parrot Green" => "#96C957",
        "Aqua" => "#00FFFF",
        "Ferozi" => "#00CED1",
        "Navy Blue" => "#000080",
        "Dark Turquoise" => "#00CED1"
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
        "Pink" => "#FFC0CB",
        "Light Pink" => "#FFB6C1",
        "Dull Pink" => "#D89AA6",
        "Pale Lilac" => "#DCD0FF",
        "Light Tea Pink" => "#F6E2D3",
        "Peyote" => "#DDD6C3",
        "Steel Grey" => "#4682B4",
        "Olive" => "#808000",
        "Green" => "#008000"
      }

    else
      {}
    end
  end
end
