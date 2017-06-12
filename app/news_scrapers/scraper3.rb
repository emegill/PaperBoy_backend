require 'httparty'
require 'Nokogiri'
# require 'Open_uri'

class Scraper

attr_accessor :parse_page

    def initialize
        doc = HTTParty.get("https://billypenn.com/")
        @parse_page ||= Nokogiri::HTML(doc)
    end

    def get_story
        story = item_container.css(".c-heading__title").children.map { |story| story.text }.compact
        p story
        story.reject {|date| date.length < 3}
    end

    def get_aurthor
        aurthor = item_container.css(".c-meta-info__name.c-meta-info__stack__item.c-meta-info__stack__mover").children.map { |aurthor| aurthor.text }.compact
        p aurthor
        aurthor.reject {|date| date.length < 3}
    end

    def get_content
        content = item_container.css(".c-overview__title").children.map { |content| content.text }.compact
        p content
        content.reject {|date| date.length < 3}
    end

    def get_date
        date = item_container.css(".c-meta-info__timestamp__inner").children.map { |date| date.text }.compact
        p date
        date.reject {|date| date.length < 3}
    end

    def run_scraper


        story = get_story
        aurthor = get_aurthor
        content = get_content
        date = get_date


        (0...story.size).each do |index|
            puts "- - - index: #{index +1} - - - "
            puts "Story: #{story[index]} | aurthor: #{aurthor[index]} | content: #{content[index]} | date: #{date[index]}"

        end

    end

    private

    def item_container
        parse_page.css(".content-wrapper.row")
    end


end

scraper = Scraper.new
scraper.run_scraper
