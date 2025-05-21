class CreateStylePreferences < ActiveRecord::Migration[8.0]
  def change
    create_table :style_preferences do |t|
      t.references :user, null: false, foreign_key: true
      t.string :fit_preference

      t.timestamps
    end
  end
end
