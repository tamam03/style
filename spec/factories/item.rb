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
    
    after(:create) do |item|
      create(:tag_map, item: item, item_tag: create(:item_tag))
    end
  end
end
