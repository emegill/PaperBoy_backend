class Chosensite < ApplicationRecord
    belongs_to :feed
    belongs_to :news_site
end
