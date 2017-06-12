class ArticlesController < ApplicationController

def index
    scrape
    render json: Article.all
end


def scrape
    scraper = Scraper.new
    results = scraper.run_scraper
    5.times do |index|
    Article.create!(title: results[:story][index], author: results[:author][index], content: results[:content][index], newssite_id: 2)
    render json: Article.all
    end

end

end
