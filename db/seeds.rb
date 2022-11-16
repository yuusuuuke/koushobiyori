# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Admin.create!(email: 'admin@admin', password: 'adminadmin')

User.create!(email: "y@y", password: "yyyyyy", nickname: "yyyyyy")
  
User.create!(email: "k@k", password: "kkkkkk", nickname: "kkkkkk")

ReadStatus.create!(
  [
    {
      status: "read"
    },
    {
      status: "reading"
    },
    {
      status: "wish"
    }
  ]
)
  
Category.create!(
  [
    {
      name: "コミック(漫画)", genre_code: "001001"
    },
    {
      name: "語学・学習参考書", genre_code: "001002"
    },
    {
      name: "絵本・児童書・図鑑", genre_code: "001003"
    },
    {
      name: "小説・エッセイ", genre_code: "001004"
    },
    {
      name: "パソコン・システム開発", genre_code: "001005"
    },
    {
      name: "ビジネス・経済・就職", genre_code: "001006"
    },
    {
      name: "旅行・留学・アウトドア", genre_code: "001007"
    },
    {
      name: "人文・思想・社会", genre_code: "001008"
    },
    {
      name: "ホビー・スポーツ・美術", genre_code: "001009"
    },
    {
      name: "美容・暮らし・健康・料理", genre_code: "001010"
    },
    {
      name: "エンタメ・ゲーム", genre_code: "001011"
    },
    {
      name: "科学・技術", genre_code: "001012"
    },
    {
      name: "写真集・タレント", genre_code: "001013"
    },
    {
      name: "資格・検定", genre_code: "001016"
    },
    {
      name: "ライトノベル", genre_code: "001017"
    },
    {
      name: "楽譜", genre_code: "001018"
    },
    {
      name: "文庫", genre_code: "001019"
    },
    {
      name: "新書", genre_code: "001020"
    },
    {
      name: "ボーイズラブ(BL)", genre_code: "001021"
    },
    {
      name: "付録付き", genre_code: "001022"
    },
    {
      name: "バーゲン本", genre_code: "001023"
    },
    {
      name: "セット本", genre_code: "001025"
    },
    {
      name: "カレンダー・手帳・家計簿", genre_code: "001026"
    },
    {
      name: "文具・雑貨", genre_code: "001027"
    },
    {
      name: "医学・薬学・看護学・歯科学", genre_code: "001028"
    },
    {
      name: "ティーンズラブ(TL)", genre_code: "001029"
    }
  ]
)
