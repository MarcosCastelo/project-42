class Manga < ApplicationRecord
    validates :title, :link, presence: true
    validates :link, uniqueness: true
end
