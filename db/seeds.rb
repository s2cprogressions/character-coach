# coding: utf-8
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
    "challenges"=>
    ":writing_hand: I failed a test\r\n:confused: I'm failing a class\r\n:disappointed_relieved: I'm late to my classes\r\n:persevere: I don't get along with people at school",
    "thinking"=>
    ":pensive: I’m not good in this subject\r\n:slight_frown: I’m not good at school work\r\n:weary: There is too much pressure\r\n:weary: It's just too hard\r\n:disappointed: I'm a failure\r\n:confounded: I don't have what it takes to succeed\r\n:sweat: No one can help me",
    "feelings"=>
    ":rage: Angry\r\n:worried: Worried\r\n:sweat: Anxious\r\n:disappointed_relieved: Nervous\r\n:disappointed: Sad\r\n:fearful: Scared\r\n:angry: Mad\r\n:slight_smile: Okay\r\n:upside_down: Content",
    "concerns"=>
    ":thumbsdown: I’ll fail a class\r\n:fingers_crossed: I'll cheat on a test\r\n:mortar_board: I won't graduate\r\n:writing_hand: I'll skip school\r\n:frowning2: I'll do a bad job",
    "positive_thoughts"=>
    ":nerd: I have the talents and abilities to succeed\r\n:smile: I will work hard and improve\r\n:sunglasses: I see myself reaching my goals",
    "positive_behaviors"=>
    ":handshake: Ask for help from an adult\r\n:thumbsup: Make a plan # (to study, to prepare, to fix something)\r\n:hugging: Say I'm sorry\r\n:raised_hand: Stop behaviors that keep you from succeeding\r\n:grin: Practice positive self-talk",
  )
end
