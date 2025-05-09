class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.decimal :price
      t.string :color
      t.string :image_url
      t.string :brand
      t.string :link

      t.timestamps
    end
  end
end
