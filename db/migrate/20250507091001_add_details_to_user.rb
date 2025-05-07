class AddDetailsToUser < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :name, :string
    add_column :users, :height, :integer
    add_column :users, :weight, :integer
    add_column :users, :undertone, :string
  end
end
