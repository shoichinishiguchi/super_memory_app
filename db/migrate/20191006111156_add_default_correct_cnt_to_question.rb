class AddDefaultCorrectCntToQuestion < ActiveRecord::Migration[5.2]
  def up
    change_column :questions, :correct_cnt, :integer, null:false, default: 0
    change_column :questions, :wrong_cnt, :integer, null:false, default: 0
  end
  def down
    change_column :questions, :correct_cnt, :integer
    change_column :questions, :wrong_cnt, :integer
  end
end
