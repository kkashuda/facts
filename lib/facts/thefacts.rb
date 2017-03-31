class Facts::TheFacts
  attr_accessor :links

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

  def self.scrape_links
    doc = Nokogiri::HTML(open("http://www.generatefacts.com/"))
    find_links = doc.css('div.category-box a[href]')
    links = find_links.map {|element| element["href"]}
    @links = links.uniq
  end

  def self.index(index)
    self.scrape_links
    category = "http://www.generatefacts.com#{@links[index]}"
    puts category
  end

end
