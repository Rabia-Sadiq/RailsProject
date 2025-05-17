class UsersController < ApplicationController
  before_action :authenticate_user!

  def palette
    @undertone = current_user.undertone

    @color_palette = case @undertone
    when "warm"
      WARM_UNDERTONE_COLORS
    when "cool"
      COOL_UNDERTONE_COLORS
    when "neutral"
      NEUTRAL_UNDERTONE_COLORS
    else
      {}
    end
  end

  private

  WARM_UNDERTONE_COLORS = {
    "Orange" => "#FFA500",
    "coral" => "#FF7F50",
    "pnk" => "#FFC0CB",
    "Fushia Pink" => "#FF77FF",
    "chocolate" => "#7B3F00",
    "Brown" => "#8B4513",
    "L-PINK" => "#FFB6C1",
    "Red" => "#FF0000",
    "peach" => "#FFE5B4",
    "coral peach" => "#F88379",
    "crimson" => "#DC143C",
    "Coffee" => "#6F4E37",
    "D-PINK" => "#FF1493",
    "Tea Rose" => "#F4C2C2",
    "Pumpkin Orange" => "#FF7518",
    "Mango Orange" => "#FF8243",
    "Carrot Orange" => "#ED9121",
    "Mustard" => "#FFDB58",
    "golden" => "#FFD700",
    "Gold" => "#FFD700",
    "Yellow" => "#FFFF00",
    "Lemon Yellow" => "#FFF44F",
    "ylow" => "#FFFF00",
    "Lemon" => "#FFFACD",
    "L-YELLOW" => "#FFFACD",
    "Dull Yellow" => "#E1C699",
    "sienna" => "#A0522D",
    "tan" => "#D2B48C",
    "Chrome" => "#FFA700",
    "Anari" => "#DE3163",
    "Yellow Ochre" => "#C9AE5D",
    "L-GREEN" => "#B7D7A8",
    "Apple Green" => "#8DB600",
    "Blush Pink" => "#F4C2C2",
    "Dull Pink" => "#D89AA6"
  }

  COOL_UNDERTONE_COLORS = {
    "pink" => "#FFC0CB",
    "Turquoise" => "#40E0D0",
    "lilc" => "#C8A2C8",
    "lilac" => "#C8A2C8",
    "Fuchsia" => "#FF00FF",
    "Aqua" => "#00FFFF",
    "Aqua Green" => "#00FFCC",
    "Sky Blue" => "#87CEEB",
    "Blue" => "#0000FF",
    "Royal Blue" => "#4169E1",
    "Navy Blue" => "#000080",
    "Purplish Blue" => "#6050DC",
    "Purple" => "#800080",
    "Candy Purple" => "#A020F0",
    "Mint Green" => "#98FF98",
    "Light Green" => "#90EE90",
    "green" => "#008000",
    "D-GREEN" => "#006400",
    "grn" => "#008000",
    "gren" => "#228B22",
    "Teal" => "#008080",
    "Teal Green" => "#00827F",
    "Sea Green" => "#2E8B57",
    "Light Emerald" => "#50C878",
    "Ice Blue" => "#F0F8FF",
    "Indigo" => "#4B0082",
    "Dark Blue" => "#00008B",
    "Greyish Blue" => "#5E738B",
    "Shocking Pink" => "#FC0FC0",
    "Bubble Pink" => "#F6D1D1",
    "Powder Pink" => "#FFB6C1",
    "Parrot Green" => "#96C957",
    "Ferozi" => "#00CED1",
    "Dark Turquoise" => "#00CED1",
    "Magenta" => "#FF00FF",
    "Light Blue" => "#ADD8E6",
    "Pinkish Red" => "#FF5A5F",
    "Redish Maroon" => "#800000",
    "Mulberry" => "#70193D",
    "Lavender" => "#E6E6FA",
    "pale lilac" => "#DCD0FF",
    "Army Green" => "#4B5320",
    "AliceBlue" => "#F0F8FF"
  }

  NEUTRAL_UNDERTONE_COLORS = {
    "GREY" => "#808080",
    "gray" => "#808080",
    "Off White" => "#FAF9F6",
    "ivory" => "#FFFFF0",
    "WHITE" => "#FFFFFF",
    "Beige" => "#F5F5DC",
    "Ecru" => "#C2B280",
    "Cream" => "#FFFDD0",
    "Light Grey" => "#D3D3D3",
    "Steel Grey" => "#4682B4",
    "Skin" => "#FFDAB9",
    "Polynet" => "#F5F5F5",
    "Poly Silk" => "#F8F8FF",
    "mushroom" => "#BFAE9C",
    "Mouse" => "#A9A9A9",
    "Light Pink" => "#FFB6C1",
    "rose" => "#FF007F",
    "Peach Pink" => "#FFD1DC",
    "Peachy Pink" => "#FFDAB9",
    "Ice" => "#F0F8FF",
    "SILK" => "#F8F8FF",
    "multi" => "#D3D3D3",
    "Light Tea Pink" => "#F6E2D3",
    "Raw Silk" => "#F8F8FF",
    "Organza" => "#F5FFFA",
    "Chiffon" => "#FAF0E6",
    "Net" => "#F5F5F5",
    "Blended" => "#ECECEC",
    "brwn" => "#8B4513",
    "black" => "#000000",
    "Marsala" => "#964F4C",
    "Maroon" => "#800000",
    "Olive" => "#808000",
    "Olive Green" => "#556B2F",
    "Deep Green" => "#006400",
    "Peyote" => "#DDD6C3"
  }
end
