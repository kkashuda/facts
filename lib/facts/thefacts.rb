class Facts::TheFacts
  attr_accessor :category, :fact, :url

  def self.scrape
    self.scrape_categories
    self.scrape_facts
  end

  def self.scrape_categories
    doc = Nokogiri::HTML(open("http://www.generatefacts.com/"))
    categories = []
    doc.css("div.category-box a").children.each do |t|
      categories << t.text unless t.text.include?("\r"+"\n")
    end
    categories
  end

  def self.scrape_facts
  end

end
