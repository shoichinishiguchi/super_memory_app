class AddDefaultChangeImportanceToQuestion < ActiveRecord::Migration[5.2]
  def up
    change_column :questions, :importance, :integer, null:false, default: 5
  end
  def down
    change_column :questions, :importance, :integer, null:false, default: 0
  end
end
