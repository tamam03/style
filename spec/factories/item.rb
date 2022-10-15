FactoryBot.define do
  factory :item do
    text { Faker::Lorem.characters(number: 10) }
    brand
    user
    
    trait :close do
      status { close } 
    end
    
    trait :release do
      status { release } 
    end
    
    trait :only_clerk do
      status { only_clerk }
    end
  end
end