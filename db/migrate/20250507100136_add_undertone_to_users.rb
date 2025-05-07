class AddUndertoneToUsers < ActiveRecord::Migration[8.0]
  def change
    unless column_exists?(:users, :undertone)
      add_column :users, :undertone, :string
    end  end
end
