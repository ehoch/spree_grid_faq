class CreateSpreeProductsQuestions < ActiveRecord::Migration
  def change
    create_table :spree_products_questions, :id => false do |t|
      t.integer :product_id
      t.integer :question_id
    end
    add_index :spree_products_questions, :question_id
    add_index :spree_products_questions, :product_id
  end
end
