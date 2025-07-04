class CreateChatMessages < ActiveRecord::Migration[8.0]
  def change
    create_table :chat_messages do |t|
      t.references :user, null: false, foreign_key: true
      t.text :content
      t.boolean :is_from_bot

      t.timestamps
    end
  end
end
