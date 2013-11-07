class CardCollector
  include Singleton

  def collect
    1000.times do
    body = open(uri)
      doc = Nokogiri::HTML(body)
      word = doc.css('span.card_top_name').text
      taboos = doc.css('div.card_tabu_div')[0..4].map{|div| div.text}
      unless Card.where(word: word).exists?
        card = Card.new(word: word)
        taboos[0..4].each_with_index do |taboo, index|
          card.send("taboo#{index+1}=", taboo)
        end
        card.save!
      end
    end
  end

  def uri
    'http://www.kartabu.com/pl/index.php?filter=random'
  end
end