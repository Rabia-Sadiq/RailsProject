class CreateQuizzes < ActiveRecord::Migration[8.0]
  def change
    create_table :quizzes do |t|
      t.string :question
      t.string :option_1
      t.string :option_2
      t.string :option_3
      t.string :option_4
      t.string :answer

      t.timestamps
    end
  end
end
