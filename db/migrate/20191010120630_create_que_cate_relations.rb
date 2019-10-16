class CreateQueCateRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :que_cate_relations do |t|
      t.references :question, null: false
      t.references :category, null: false
      t.timestamps
    end
  end
end

