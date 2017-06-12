

class Scraper2

attr_accessor :parse_page

    def initialize
        doc = HTTParty.get("https://www.jacobinmag.com/")
        @parse_page ||= Nokogiri::HTML(doc)
    end

    def get_story
        story = item_container.css(".hm-di__link.hm-di-sd__link").children.map { |story| story.text }.compact
        p story
        story.reject {|date| date.length < 3}
    end

    def get_aurthor
        aurthor = item_container.css(".hm-di__author-lk.hm-di-sd__author-lk").children.map { |aurthor| aurthor.text }.compact
        p aurthor
        aurthor.reject {|date| date.length < 3}
    end

    def get_content
        content = item_container.css(".hm-di__summary.hm-di-sd__summary").children.map { |content| content.text }.compact
        p content
        content.reject {|date| date.length < 3}
    end

    def get_date
        date = item_container.css(".hm-di__date.hm-di-sd__date").children.map { |date| date.text }.compact
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

        {story: story, author: aurthor, content: content, date: date}

    end

    private

    def item_container
        parse_page.css(".zo").css(".hm-di").css(".hm-di-sd-a")
    end


end
