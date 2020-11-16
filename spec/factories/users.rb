FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.last_name}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name              {"山田"}
    first_name              {"太郎"}
    last_furigana              {"ヤマダ"}
    first_furigana              {"タロウ"}
    birth_day              {Faker::Date.backward}
  end 
end

