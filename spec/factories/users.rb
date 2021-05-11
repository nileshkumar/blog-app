FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "Tom Jerry (#{n})" }
    sequence(:email) { |n| "tom-jerry(#{n}).com"}
  end

end
