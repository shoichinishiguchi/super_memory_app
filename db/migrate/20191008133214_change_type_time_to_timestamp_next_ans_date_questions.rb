class ChangeTypeTimeToTimestampNextAnsDateQuestions < ActiveRecord::Migration[5.2]

  def up
    change_column :questions, :next_ans_date, :datetime
  end

  def down
    change_column :questions, :next_ans_date, :time
  end

end
