# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name: "admin", email: "admin@test.com", password: "password", admin: true)

9.times do |n|
  User.create!(name: "user#{n + 1}", email: "user#{n + 1}@test.com", password: "password")
end

datas = {
           '北海道地方' => ["北海道"],
           '東北地方' => ["青森県", "岩手県", "宮城県", "秋田県", "山形県", "福島県"],
           '関東地方' => ["茨城県", "栃木県", "群馬県", "埼玉県", "千葉県", "東京都", "神奈川県"],
           '中部地方' => ["新潟県", "富山県", "石川県", "福井県", "山梨県", "長野県", "岐阜県", "静岡県", "愛知県"],
           '近畿地方' => ["三重県", "滋賀県", "京都府", "大阪府", "兵庫県", "奈良県", "和歌山県"],
           '中国地方' => ["鳥取県", "島根県", "岡山県", "広島県", "山口県"],
           '四国地方' => ["徳島県", "香川県", "愛媛県", "高知県"],
           '九州・沖縄地方' => ["福岡県", "佐賀県", "長崎県", "熊本県", "大分県", "宮崎県", "鹿児島県", "沖縄県"]
         }
         
datas.each do |key, value|
  area = Area.create!(content: key)
  value.each do |prefecture|
    Prefecture.create!(area_id: area.id, content: prefecture)
  end
end
