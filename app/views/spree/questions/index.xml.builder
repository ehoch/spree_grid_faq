xml.instruct! :xml, :version => "1.0" 
xml.rss(:version=>"2.0") do
  xml.channel do
    xml.title("#{Spree::Config[:site_name]} FAQ")
    xml.link(questions_url)
    xml.description("The latest questions answered by #{Spree::Config[:site_name]}")
    xml.language('en-us')
    Spree::Question.order(:created_at).reverse_order.limit(10).each do |question|
      xml.item do
         xml.title(question.question)
         xml.description(question.answer)
         xml.author('webmaster@alarmgrid.com (AlarmGrid.com)')               
         xml.pubDate(question.created_at.to_s(:rfc822))
         xml.link(question_url(question))
         xml.guid(question_url(question))
      end
    end
  end
end