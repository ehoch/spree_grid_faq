Spree::Product.class_eval do
  has_and_belongs_to_many :questions, :join_table => 'spree_products_questions'
end