module Spree
  class QuestionsController < Spree::BaseController 

    def index
      @questions = Question.scoped
      @title = 'Frequently Asked Questions'
    end
  
    def show
      @question = Question.find_by_slug!(params[:id])
      @title = @question.question
    end
  end
end