FactoryBot.define do
  factory :book do
    author
    sequence(:title) { |n| "Book #{n}" }
    publication_date { [1...20].map(&:to_a).flatten.sample.years.ago.year }
    genre { ['Thriller', 'Horror', 'Mystery'].sample }
  end
end
