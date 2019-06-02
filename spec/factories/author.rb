FactoryBot.define do
  factory :author do
    sequence(:first_name) { |n| "John ##{n}" }
    sequence(:last_name) { |n| "Doe ##{n}" }
    date_of_birth { [20...40].map(&:to_a).flatten.sample.years.ago }
  end
end
