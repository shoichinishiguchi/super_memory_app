class RenameIntervalToNextAnsDateQuestions < ActiveRecord::Migration[5.2]
  def change
      rename_column :questions, :interval, :next_ans_date
  end
end
