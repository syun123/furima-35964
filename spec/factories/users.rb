FactoryBot.define do

  factory :user do
    nickname              {"tarou"}
    email                 {"sample@gmail.com"}
    password              {"abc1234"}
    password_confirmation {password}
    surname_kanji           {"山田"}
    surname_katakana          {"ヤマダ"}
    name_kanji             {"太郎"}
    name_katakana         {"タロウ"}
    birthday             {"2000-01-01"}
  end
end