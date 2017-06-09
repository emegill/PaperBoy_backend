class Feed < ApplicationRecord
    has_many :chosensites
    has_many :news_sites, through: :chosensites
    belongs_to :user
end
