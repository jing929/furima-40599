FactoryBot.define do
  factory :order_address do
    postal_code              { "#{rand(100..999)}-#{rand(1000..9999)}" }
    prefecture_id            { rand(2..48) }
    city                     { '東京都渋谷区' }
    address                  { '神南1-1-1' }
    building                 { '渋谷ビル101' }
    phone_number             { rand(10**9..10**10).to_s }
    token                    {"tok_abcdefghijk00000000000000000"}
  end
end