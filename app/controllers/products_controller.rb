class ProductsController < ApplicationController
  def index
    if params[:color].present?
      full_color = params[:color].strip.downcase
      first_word = full_color.split("-").first

      # First search for the full color string
      @products = Product.where("LOWER(color) LIKE ?", "%#{full_color}%")

      # If no matches found, fallback to first word
      if @products.empty? && first_word != full_color
        @products = Product.where("LOWER(color) LIKE ?", "%#{first_word}%")
      end
    else
      @products = Product.all
    end

    @products = @products.where("LOWER(brand) LIKE ?", "%#{params[:brand].downcase}%") if params[:brand].present?
    @products = @products.where("LOWER(description) LIKE ?", "%#{params[:description].downcase}%") if params[:description].present?

    if params[:min_price].present?
    @products = @products.where("price >= ?", params[:min_price].to_f)
    end

    if params[:max_price].present?
    @products = @products.where("price <= ?", params[:max_price].to_f)
    end
   case params[:sort_by]
   when 'newest'
    @products = @products.order(created_at: :desc)
   when 'oldest'
    @products = @products.order(created_at: :asc)
   when 'price_asc'
    @products = @products.order(price: :asc)
   when 'price_desc'
    @products = @products.order(price: :desc)
   end
  end
end
