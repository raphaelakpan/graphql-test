class Book < ApplicationRecord
  belongs_to :author

  scope :title_contains, -> (value) { where("title ILIKE ?", "%#{value}%") }
  scope :title_equals, -> (value) { where("LOWER(title) = ?", value.downcase) }
  scope :genre_equals, -> (value) { where(genre: value) }
end
