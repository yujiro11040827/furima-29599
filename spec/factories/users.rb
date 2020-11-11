FactoryBot.define do
  factory :user do
    nickname              {"yamada"}
    email                 {"aaa@gmail.com"}
    password              {"a1a1a1"}
    password_confirmation {password}
    first_name            {"鈴木"}
    last_name             {"一郎"}
    last_furigana         {"スズキ"}
    first_furigana        {"イチロウ"}
    birth_day             {"2000年11月11日"}
  end
end