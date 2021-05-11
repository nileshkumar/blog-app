FactoryBot.define do
  factory :user do
    name {Faker::Name.name}
    email {Faker::Internet.email}
  end

  factory :post do
    user
    title {Faker::Books::Dune.title}
    description {Faker::Lorem.paragraph(sentence_count: 2)}
    body {Faker::Lorem.paragraphs}
  end
end
