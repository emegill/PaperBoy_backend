class User < ApplicationRecord
    has_one :feed

    validates_uniqueness_of :username
    validates_presence_of :username, :password
end
