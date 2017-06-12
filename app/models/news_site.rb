class NewsSite < ApplicationRecord
    belongs_to :feed
    has_many :chosensites
    has_many :feeds, through: :chosensites
end
