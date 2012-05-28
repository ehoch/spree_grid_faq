module Spree
  class QuestionsController < Spree::BaseController 

    def index
      @questions = Question.page(params[:page])
      raise ActionController::RoutingError.new('No Matching Questions') if not params[:page].nil? and @questions.all.empty?
      @title = 'Frequently Asked Questions'
    end
  
    def show
      @question = Question.find_by_slug!(params[:id])
      @title = @question.question
    end
  end
end