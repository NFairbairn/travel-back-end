class Post < ApplicationRecord
    belongs_to :blog
    belongs_to :location
    has_one :collection
    has_many :images, through: :collection

    validates :title, length: { minimum: 1 }
    validates :title, :preview, :content, presence: true
end
