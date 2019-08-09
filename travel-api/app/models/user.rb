class User < ApplicationRecord
    has_many :blogs
    has_many :posts, through: :blogs
    has_many :pins
end
