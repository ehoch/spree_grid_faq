module Spree
  module Admin
    class QuestionsController < ResourceController

      def index
        respond_with(@collection) do |format|
          format.html
          format.json { render :json => json_data }
        end
      end

      protected

      def find_resource
        Question.find_by_slug!(params[:id])
      end

      def collection
        return @collection if @collection.present?
        params[:q] ||= {}
        params[:q][:s] ||= "created_at desc"
        @search = Spree::Question.search(params[:q])
        @collection = @search.result.page(params[:page]).per(20)
      end
    end
  end
end
