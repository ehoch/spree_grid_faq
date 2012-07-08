module Spree
  class QuestionsController < Spree::BaseController 

    def index
      @questions = Question.page(params[:page])
      raise ActionController::RoutingError.new('No Matching Questions') if not params[:page].nil? and @questions.all.empty?
      
      @title = 'Frequently Asked Questions'
      @canonical_url = questions_path(:page => (not params[:page].nil? and params[:page].to_i > 1 ? params[:page] : nil))
    end

    def browse
      @taxon = Taxon.find_by_permalink!(params[:id])
      @questions = @taxon.questions.page(params[:page])
      raise ActionController::RoutingError.new('No Matching Questions') if @questions.all.empty?

      @title = "#{@taxon.name} Frequently Asked Questions"

      render :index
    end
  
    def show
      @question = Question.find_by_slug!(params[:id])
      
      @title = @question.question
      @description = @question.description
      
      @canonical_url = question_path(@question)
    end
  end
end