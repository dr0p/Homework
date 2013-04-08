class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :name, :null => false
      t.text :content, :null => false

      t.timestamps
    end
  end
end
