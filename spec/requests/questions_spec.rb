require 'spec_helper'

describe "Questions" do

  describe "Index" do
    context "Single" do
      before (:each) do
        @question = FactoryGirl.create(:question)
      end
    
      it "should display questions" do
        visit spree.questions_path
        page.should have_content(@question.question)
      end

      it "should display descriptions" do
        visit spree.questions_path
        page.should have_content(@question.description)
      end
    end
    
    context "Multiple" do
      before (:each) do
        @questions = (1..20).collect { FactoryGirl.create(:question) }
      end
    
      it "should paginate" do
        visit spree.questions_path(:page => 2)
        page.should_not have_content(@questions[9].question)
        page.should have_content(@questions[11].question)
      end

      it "should error past pagination" do
        lambda { visit spree.questions_path(:page => 3)}.should raise_error
      end

    end
    
  end

  describe "Show" do
    before (:each) do
      @question = FactoryGirl.create(:question)
    end
    
    it "should display question" do
      visit spree.question_path(@question)
      page.should have_content(@question.question)
    end

    it "should display answer" do
      visit spree.question_path(@question)
      page.should have_content(@question.answer)
    end

  end
end
