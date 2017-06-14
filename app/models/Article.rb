class Article < ApplicationRecord
    belongs_to :newssite
    validates_uniqueness_of :title, :newssite_id

end
