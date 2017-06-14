class Feed < ApplicationRecord
    has_many :chosensites
    has_many :newssites, through: :chosensites
    belongs_to :user

    validates_uniqueness_of :user_id

end
