class Newssite < ApplicationRecord
    has_many :chosensites
    has_many :feeds, through: :chosensites
    has_many :news
end
