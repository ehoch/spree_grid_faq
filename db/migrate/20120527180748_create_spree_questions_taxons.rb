class CreateSpreeQuestionsTaxons < ActiveRecord::Migration
  def change
    create_table :spree_questions_taxons, :id => false do |t|
      t.integer :question_id
      t.integer :taxon_id
    end
    add_index :spree_questions_taxons, :question_id
    add_index :spree_questions_taxons, :taxon_id
  end
end
