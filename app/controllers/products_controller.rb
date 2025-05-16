class ProductsController < ApplicationController
  def index
    if params[:color].present?
      full_color = params[:color].strip.downcase
      first_word = full_color.split('-').first

      # Try full color match first, then fallback to first word match
      @products = Product.where('LOWER(color) LIKE ? OR LOWER(color) LIKE ?', "%#{full_color}%", "%#{first_word}%")
    else
      @products = Product.all
    end
  end
end
