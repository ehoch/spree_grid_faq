module Spree
  module Admin
    TaxonsController.class_eval do
      def selected_for_question
        @question = load_question
        @taxons = @question.taxons

        respond_with(:admin, @taxons)
      end

      def available_for_question
        @question = load_question
        @taxons = params[:q].blank? ? [] : Spree::Taxon.where('lower(name) LIKE ?', "%#{params[:q].mb_chars.downcase}%")
        @taxons.delete_if { |taxon| @question.taxons.include?(taxon) }

        respond_with(:admin, @taxons)
      end

      def select_for_question
        @question = load_question
        @taxon = Taxon.find(params[:id])
        @question.taxons << @taxon
        @question.save
        @taxons = @question.taxons

        respond_with(:admin, @taxons)
      end

      def remove_for_question
        @question = load_question
        @taxon = Taxon.find(params[:id])
        @question.taxons.delete(@taxon)
        @question.save
        @taxons = @question.taxons

        respond_with(:admin, @taxon)
      end
    
      private
  
      def load_question
        Question.find_by_slug(params[:question_id])
      end
    end
  end
end