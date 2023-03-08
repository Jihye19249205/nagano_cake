Admin.create!(
  email: 'test@test.com',
  password: 'aaaaaa',
  )

Customer.create!(
  email: 'user1@test.com',
  password: 'aaaaaaa',
  last_name: '織田',
  first_name: '信長',
  last_name_kana: 'オダ',
  first_name_kana: 'ノブナガ',
  postal_code: '1111111',
  address: '愛知県尾張市安土1-1-1',
  telephone_number: '080-1111-1111'
  )

Customer.create!(
  email: 'user2@test.com',
  password: 'aaaaaaa',
  last_name: '伊達',
  first_name: '政宗',
  last_name_kana: 'ダテ',
  first_name_kana: 'マサムネ',
  postal_code: '2222222',
  address: '宮城県仙台市宮城1-1-1',
  telephone_number: '080-2222-2222'
  )

Genre.create!(id: '1', name: 'ケーキ')
Genre.create!(id: '2', name: 'プリン')
Genre.create!(id: '3', name: '焼き菓子')
Genre.create!(id: '4', name: 'キャンディ')

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
