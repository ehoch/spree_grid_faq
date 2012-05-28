module Spree
  module Admin
    ProductsController.class_eval do
      def selected_for_question
        @question = load_question
        @products = @question.products

        respond_with(:admin, @products)
      end

      def available_for_question
        @question = load_question
        @products = params[:q].blank? ? [] : Spree::Product.where('lower(name) LIKE ?', "%#{params[:q].mb_chars.downcase}%")
        @products.delete_if { |product| @question.products.include?(product) }

        respond_with(:admin, @products)
      end

      def select_for_question
        @question = load_question
        @product = Product.find_by_permalink(params[:id])
        @question.products << @product
        @question.save
        @products = @question.products

        respond_with(:admin, @products)
      end

      def remove_for_question
        @question = load_question
        @product = Product.find_by_permalink(params[:id])
        @question.products.delete(@product)
        @question.save
        @products = @question.products

        respond_with(:admin, @product)
      end
    
      private
  
      def load_question
        Question.find_by_slug(params[:question_id])
      end
    end
  end
end