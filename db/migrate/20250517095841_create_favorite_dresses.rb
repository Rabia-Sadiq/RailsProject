class CreateFavoriteDresses < ActiveRecord::Migration[8.0]
  def change
    create_table :favorite_dresses do |t|
      t.references :user, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
