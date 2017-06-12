class Article < ApplicationRecord
    belongs_to :newssite
    validates_uniqueness_of :title, :content, :author, :date, :url

end
