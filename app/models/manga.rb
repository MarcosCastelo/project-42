class Manga < ApplicationRecord
    validates :title, :link, presence: true
end
