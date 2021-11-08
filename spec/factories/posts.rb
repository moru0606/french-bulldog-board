FactoryBot.define do
  factory :post do
    title { 'タイトル' }
    content { '内容１０文字以上のサンプル' }
    association :user
  end
end