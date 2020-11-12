FactoryBot.define do
  factory :training do
    goal { "スクワットを30回、を1日3セットやる！" }
    reward { "目標達成できたら、肉パーティー！" }
    date_start { "2020-02-02" }
    expected_date { "2020-09-09" }
    
    association :user
    after(:build) do |training|
      training.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
