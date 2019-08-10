class Post < ApplicationRecord
    belongs_to :blog
    belongs_to :location
    has_one :collection
    has_many :images, through: :collection
end
