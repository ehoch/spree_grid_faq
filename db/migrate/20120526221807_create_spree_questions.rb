class CreateSpreeQuestions < ActiveRecord::Migration
  def change
    create_table :spree_questions do |t|
      t.string :question
      t.text :answer
      t.text :description
      t.string :slug
      t.timestamps
    end
    add_index :spree_questions, :slug
  end
end
