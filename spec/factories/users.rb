FactoryBot.define do
  factory :user do
    name                  {Faker::Japanese::Name.name}
    name_reading          {'ヤマダハナコ'}
    email                 {Faker::Internet.free_email}
    password              {"a1"+ Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    address               {'東京都新宿区西新宿1-1-1-1'}
    phone_number {"0123456789"}
    datetime              {Faker::Date.birthday(min_age: 0, max_age: 130)}
    blood_type_id         {3}       
    body_weight           {55}     
    height                {165}        
    body_temperature      {36}        
    allergy_id            {2}      
    chronic_condition_id  {3}       
    venue_id              {5}
    public_uid            {'ABn4g'}
    end
end