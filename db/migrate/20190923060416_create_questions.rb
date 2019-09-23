class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :question,  null:false
      t.string :answer, null: false
      t.integer :importance
      t.time :interval
      t.integer :correct_cnt
      t.integer :wrong_cnt
      t.timestamp :last_ans_date

      t.timestamps
    end
  end
end
