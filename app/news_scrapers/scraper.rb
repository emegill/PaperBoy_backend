require 'httparty'
require 'Nokogiri'
# require 'Open_uri'

class Scraper

attr_accessor :parse_page

    def initialize
        doc = HTTParty.get("https://theintercept.com/")
        @parse_page ||= Nokogiri::HTML(doc)
    end

    def get_story
        story = item_container.css(".Promo-title").children.map { |story| story.text }.compact
    end

    def get_author
        aurthor = item_container.css(".Promo-author").children.map { |aurthor| aurthor.text }.compact
    end

    def get_content
        content = item_container.css(".Promo-excerpt").children.map { |content| content.text }.compact
    end

    def get_date
        date = item_container.css(".Promo-author").css(".Promo-date").children.map { |date| date.text }.compact
        date.reject {|date| date.length < 3}
    end

    def run_scraper


        story = get_story
        author = get_author
        content = get_content
        date = get_date


        (0...story.size).each do |index|
             News.create(story[index], author: author[index], content: content[index])

        end

    end

    private

    def item_container
        parse_page.css(".Homepage-section")
    end


end

# scraper = Scraper.new
# scraper.run_scraper
