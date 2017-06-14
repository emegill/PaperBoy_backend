class ArticlesController < ApplicationController

def index
  scrape
  scrape2
  scrape3

end


def create

  api_call = Nyt.new
  api_call.get_articles
  if params[:guardian]
  guardian_params["articles"].first(5).each do |article|

  Article.create(title:article["title"], author:article["author"], content:article["description"], url:article["url"], date:article["publishedAt"], newssite_id:3)

  end
end

  if params[:al_jazeera]
  jazeera_params["articles"].first(5).each do |article|
    p "THIS IS AN ARTICLE!!!!!!!"
p article
  Article.create(title:article["title"], author:article["author"], content:article["description"], url:article["url"], date:article["publishedAt"], newssite_id:6)

  end
end

  if params[:bbc]
  bbc_params["articles"].first(5).each do |article|

p article
  Article.create(title:article["title"], author:article["author"], content:article["description"], url:article["url"], date:article["publishedAt"], newssite_id:7)

  end
end
end


def scrape
    scraper = Scraper.new
    results = scraper.run_scraper
    5.times do |index|
    Article.create(title: results[:story][index], author: results[:author][index], content: results[:content][index], newssite_id:2)
    end

end

    def scrape2
        scraper = Scraper2.new
        results = scraper.run_scraper
        # render json: results
        5.times do |index|
        Article.create(title: results[:story][index], author: results[:author][index], content: results[:content][index], newssite_id:4)
    end

end

    def scrape3
        scraper = Scraper3.new
        results = scraper.run_scraper
        # render json: results
        5.times do |index|
        Article.create(title: results[:story][index], author: results[:author][index], content: results[:content][index], newssite_id:5)
    end

end


private

def guardian_params

params.require(:guardian).permit!

end
private

def jazeera_params

params.require(:al_jazeera).permit!

end
private

def bbc_params

params.require(:bbc).permit!

end

end
