FactoryGirl.define do
  factory :question, :class => Spree::Question do
    sequence(:question) { |n| "Question #{n}" }
    description "Description"
    answer "Answer"
  end
end