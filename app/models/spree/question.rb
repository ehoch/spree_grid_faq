module Spree
  class Question < ActiveRecord::Base
    has_and_belongs_to_many :taxons, :join_table => 'spree_questions_taxons'
    has_and_belongs_to_many :products, :join_table => 'spree_products_questions'
    
    attr_accessible :question, :answer, :description

    validates :question, :presence => true, :uniqueness => true
    validates :slug, :uniqueness => true
    validates_presence_of :answer

    before_validation do
      self.slug = question.to_s.to_url(:limit => 64) unless slug
    end
    
    def to_param
      slug
    end
      
      
  end
end
