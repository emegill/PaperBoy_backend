class Chosensite < ApplicationRecord
    belongs_to :feed
    belongs_to :newssite

    validates_uniqueness_of :feed_id
end
