FactoryBot.define do
  factory :user do
    name {Faker::Name.name}
    email {Faker::Internet.free_email}
    password{ '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation {password}
    family_name {"hoge"}
    first_name {"hoge"}
    family_name_furigana {"hoge"}
    first_name_furigana {"hoge"}
    birthday {"hoge"}
  end
end
