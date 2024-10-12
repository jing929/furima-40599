FactoryBot.define do
  factory :item do
    item_name              { Faker::Commerce.product_name[1..40] }
    description            { Faker::Lorem.paragraph_by_chars(number: 1000, supplemental: false) }
    category_id            { rand(2..11) }
    condition_id           { rand(2..7) }
    prefecture_id          { rand(2..48) }
    shopping_cost_id       { rand(2..3) }
    shopping_day_id        { rand(2..4) }
    price                  { rand(300..9999999) }

    after(:build) do |item|
      item.image.attach(io: File.open('spec/factories/sample_image/sample_image.jpg'), filename: 'sample_image.jpg')
    end

    association :user
  end
end