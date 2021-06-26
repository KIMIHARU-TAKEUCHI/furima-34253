FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              { '1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name  {'竹内'}
    family_name  {'仁栄'}
    first_name_kana  {'タケウチ'}
    family_name_kana  {'キミハル'}
    birth_data  {'1900-01-01'}
  end
end