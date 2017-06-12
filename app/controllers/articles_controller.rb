class ArticlesController < ApplicationController

def index
    scrape
    render json: Article.all
end

def nyt

api_call = Nyt.new
api_call.get_articles
end

def create
  p guardian_params
guardian_params["articles"].first(5).each do |article|

Article.create(title:article["title"], author:article["author"], content:article["description"], url:article["url"], date:article["publishedAt"], newssite_id:2)

  end

end



def scrape
    scraper = Scraper.new
    results = scraper.run_scraper
    5.times do |index|
<<<<<<< HEAD
    Article.create!(title: results[:story][index], author: results[:author][index], content: results[:content][index], newssite_id: 2)
    render json: Article.all
=======
    Article.create!(title: results[:story][index], author: results[:author][index], content: results[:content][index], newssite_id:2)
>>>>>>> 4c46e852f582929d13915046bf612df3b178a596
    end

end

private

def guardian_params

params.require(:guardian).permit!


end

end
