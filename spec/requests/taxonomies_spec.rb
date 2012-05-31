require 'spec_helper'

describe "Taxonomies" do
  
  describe "Show" do
    
    before (:each) do
      root_taxon = FactoryGirl.create(:taxon)
      @taxon = FactoryGirl.create(:taxon, :parent_id => root_taxon.id)
    end
  
    it "should not display sidebar FAQ w/o questions" do
      visit spree.nested_taxons_path(@taxon.permalink)
      page.should_not have_css("[data-hook='taxon_sidebar_faq']")
    end

    it "should display sidebar questions for current taxon" do
      @question = FactoryGirl.create(:question, :taxons => [@taxon])
      visit spree.nested_taxons_path(@taxon.permalink)
      page.should have_css("[data-hook='taxon_sidebar_faq']")
      page.should have_content(@question.question)
    end

    it "should only display first 3 questions in sidebar for current taxon" do
      @questions = (1..4).collect { FactoryGirl.create(:question, :taxons => [@taxon]) }
      visit spree.nested_taxons_path(@taxon.permalink)
      page.should have_css("[data-hook='taxon_sidebar_faq']")
      page.should have_content(@questions[0].question)
      page.should_not have_content(@questions[3].question)
    end
  
  end
  
end
