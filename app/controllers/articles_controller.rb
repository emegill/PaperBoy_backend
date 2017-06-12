class ArticlesController < ApplicationController

def index
    render json: Article.all
end


def scrape
    scraper = Scraper.new
    results = scraper.run_scraper
    # render json: results
    5.times do |index|
    Article.create!(title: results[:story][index], author: results[:author][index], content: results[:content][index], newssite_id: 2)
    end

end

end
