class Manga < ApplicationRecord
    validates :title, :link, presence: true
    validates :link, uniqueness: true
    has_and_belongs_to_many :users
end
