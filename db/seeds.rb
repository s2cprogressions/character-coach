# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
unless User.find_by_email('admin@progressions.us')
  User.create!(email: 'admin@progressions.us', password: 'sting-din-daydream', password_confirmation: 'sting-din-daydream')
end


unless Category.find_by_title("School")
  Category.create(
    "title"=>"School",
    "challenges"=>"I failed a test\r\nI'm failing a class\r\nI'm late to my classes\r\nI don't get along with people at school",
    "thinking"=>
    "I'm not good in this subject\r\nI'm not good at school work\r\nThere is too much pressure\r\nIt's just too hard\r\nI'm a failure\r\nI don't have what it takes to succeed\r\nNo one can help me",
    "feelings"=>"Angry\r\nWorried\r\nAnxious\r\nNervous\r\nSad\r\nScared\r\nMad\r\nOkay\r\nContent",
    "concerns"=>"I'll fail a class\r\nI'll cheat on a test\r\nI won't graduate\r\nI'll skip school\r\nI'll do a bad job",
    "positive_thoughts"=>"I have the talents and abilities to succeed\r\nI will work hard and improve\r\nI see myself reaching my goals",
    "positive_behaviors"=>
    "Ask for help from an adult\r\nMake a plan\r\nSay I'm sorry\r\nStop behaviors that keep you from succeeding\r\nPractice positive self-talk",
  )
end
