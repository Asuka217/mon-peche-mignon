FactoryBot.define do
  factory :achievement do
    date_end { '2020-11-11' }
    report { "目標達成できたら、肉パーティー！" }
    
    association :user
    association :training
    after(:build) do |achievement|
      achievement.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
