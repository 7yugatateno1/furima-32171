FactoryBot.define do
  factory :user do
    name {Faker::Name.name}
    email {Faker::Internet.free_email}
    password{ '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation {password}
    family_name {"山田"}
    first_name {"太郎"}
    family_name_furigana {"ヤマダ"}
    first_name_furigana {"タロウ"}
    birthday {"2000-01-01"}
  end
end
