Spree::Taxon.class_eval do
  has_and_belongs_to_many :questions, :join_table => 'spree_questions_taxons'
end