class AddTitleToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :title, :string, null:false
  end
end
