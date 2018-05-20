class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.integer :qno
      t.text :title
      t.text :q1
      t.text :q2
      t.text :q3
      t.text :q4

      t.timestamps
    end
  end
end
