class Facts::TheFacts
  attr_accessor :links, :category, :facts

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
    @category = "http://www.generatefacts.com#{@links[index]}"
    self.scrape_category
  end

  def self.scrape_category
    doc = Nokogiri::HTML(open(@category))
    find_facts = doc.css("table.table a[href]")
    # remove white space and unwanted characters
    @facts = find_facts.map {|e| e.text.strip!.gsub(/[\u0001-\u001A]/ , '')}
    puts @facts.sample
    puts 
  end

end
