# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Admin.create!(
  email: 'admin@admin',
  password: 'adminadmin'
)

User.create!(
  email: "y@y",
  password: "yyyyyy",
  nickname: "yyyyyy"
  )
  
User.create!(
  email: "k@k",
  password: "kkkkkk",
  nickname: "kkkkkk"
  )
  
Category.create!(
  name: "コミック"
  )

  
Book.create!(
  category_id: 1,
  title: "キングダム 66",
  author: "原 泰久",
  isbn: "9784088924250",
  item_url: "https://books.rakuten.co.jp/rb/17232427/",
  item_image_url: "https://thumbnail.image.rakuten.co.jp/@0_mall/book/cabinet/4250/9784088924250_1_3.jpg?_ex=64x64"
  )