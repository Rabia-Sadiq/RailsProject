class CreateFavoriteColors < ActiveRecord::Migration[8.0]
  def change
    create_table :favorite_colors do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :hex

      t.timestamps
    end
  end
end
