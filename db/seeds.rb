# coding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create_with(
  password: "sting-din-daydream",
  password_confirmation: "sting-din-daydream"
).find_or_create_by!(email: "admin@progressions.us")

unless Category.find_by(title: "School")
  Category.create(
    title: "School",
    challenges_attributes: [
      {
        icon: "writing_hand",
        text: "I failed a test",
      },
      {
        icon: "confused",
        text: "I'm failing a class",
      },
      {
        icon: "disappointed_relieved",
        text: "I'm late to my classes",
      },
      {
        icon: "persevere",
        text: "I don't get along with people at school",
      },
    ],
    thoughts_attributes: [
      {
        icon: "pensive",
        text: "I’m not good in this subject",
      },
      {
        icon: "slight_frown",
        text: "I’m not good at school work",
      },
      {
        icon: "weary",
        text: "There is too much pressure",
      },
      {
        icon: "weary",
        text: "It's just too hard",
      },
      {
        icon: "disappointed",
        text: "I'm a failure",
      },
      {
        icon: "confounded",
        text: "I don't have what it takes to succeed",
      },
      {
        icon: "sweat",
        text: "No one can help me",
      },
    ],
    feelings_attributes: [
      {
        icon: "rage",
        text: "Angry",
      },
      {
        icon: "worried",
        text: "Worried",
      },
      {
        icon: "sweat",
        text: "Anxious",
      },
      {
        icon: "disappointed_relieved",
        text: "Nervous",
      },
      {
        icon: "disappointed",
        text: "Sad",
      },
      {
        icon: "fearful",
        text: "Scared",
      },
      {
        icon: "angry",
        text: "Mad",
      },
      {
        icon: "slight_smile",
        text: "Okay",
      },
      {
        icon: "upside_down",
        text: "Content",
      },
    ],
    concerns_attributes: [
      {
        icon: "thumbsdown",
        text: "I’ll fail a class",
      },
      {
        icon: "fingers_crossed",
        text: "I'll cheat on a test",
      },
      {
        icon: "mortar_board",
        text: "I won't graduate",
      },
      {
        icon: "writing_hand",
        text: "I'll skip school",
      },
      {
        icon: "frowning2",
        text: "I'll do a bad job",
      },
    ],
    positive_thoughts_attributes: [
      {
        icon: "nerd",
        text: "I have the talents and abilities to succeed",
      },
      {
        icon: "smile",
        text: "I will work hard and improve",
      },
      {
        icon: "sunglasses",
        text: "I see myself reaching my goals",
      },
    ],
    positive_behaviors_attributes: [
      {
        icon: "handshake",
        text: "Ask for help from an adult",
      },
      {
        icon: "thumbsup",
        text: "Make a plan # (to study, to prepare, to fix something)",
      },
      {
        icon: "hugging",
        text: "Say I'm sorry",
      },
      {
        icon: "raised_hand",
        text: "Stop behaviors that keep you from succeeding",
      },
      {
        icon: "grin",
        text: "Practice positive self-talk"
      },
    ]
  )
end

unless Category.find_by(title: "Trouble")
  Category.create(
    title: "Trouble",
    challenges_attributes: [
      {
        icon: "sweat",
        text: "I got in trouble",
      },
      {
        icon: "punch",
        text: "I got suspended",
      },
      {
        icon: "triumph",
        text: "I talked back to my parents",
      },
      {
        icon: "point_right",
        text: "I got sent to the office",
      },
    ],
    thoughts_attributes: [
      {
        icon: "disappointed",
        text: "I don't get along with someone important to me",
      },
      {
        icon: "unamused",
        text: "I don't want to get along with someone",
      },
      {
        icon: "zipper_mouth",
        text: "I can't stop saying things I don't mean",
      },
      {
        icon: "weary",
        text: "It's just too hard",
      },
      {
        icon: "disappointed",
        text: "I'm a failure",
      },
      {
        icon: "confounded",
        text: "I don't have what it takes to succeed",
      },
      {
        icon: "sweat",
        text: "No one can help me",
      },
    ],
    feelings_attributes: [
      {
        icon: "rage",
        text: "Angry",
      },
      {
        icon: "worried",
        text: "Worried",
      },
      {
        icon: "sweat",
        text: "Anxious",
      },
      {
        icon: "disappointed_relieved",
        text: "Nervous",
      },
      {
        icon: "disappointed",
        text: "Sad",
      },
      {
        icon: "fearful",
        text: "Scared",
      },
      {
        icon: "angry",
        text: "Mad",
      },
      {
        icon: "slight_smile",
        text: "Okay",
      },
      {
        icon: "upside_down",
        text: "Content",
      },
    ],
    concerns_attributes: [
      {
        icon: "punch",
        text: "I'll get into a fight",
      },
      {
        icon: "angry",
        text: "I'll yell at someone important to me",
      },
      {
        icon: "weary",
        text: "I’ll lose my friend",
      },
      {
        icon: "slight_frown",
        text: "I'll cheat on a test",
      },
      {
        icon: "writing_hand",
        text: "I'll skip school",
      },
      {
        icon: "frowning2",
        text: "I'll do a bad job",
      },
    ],
    positive_thoughts_attributes: [
      {
        icon: "nerd",
        text: "I have the talents and abilities to succeed",
      },
      {
        icon: "smile",
        text: "I will work hard and improve",
      },
      {
        icon: "sunglasses",
        text: "I see myself reaching my goals",
      },
    ],
    positive_behaviors_attributes: [
      {
        icon: "handshake",
        text: "Ask for help from an adult",
      },
      {
        icon: "thumbsup",
        text: "Make a plan # (to study, to prepare, to fix something)",
      },
      {
        icon: "hugging",
        text: "Say I'm sorry",
      },
      {
        icon: "raised_hand",
        text: "Stop behaviors that keep you from succeeding",
      },
      {
        icon: "grin",
        text: "Practice positive self-talk"
      },
    ]
  )
end

unless Category.find_by(title: "Attitude")
  Category.create(
    title: "Attitude",
    challenges_attributes: [
      {
        icon: "angry",
        text: "I have a bad attitude",
      },
      {
        icon: "zipper_mouth",
        text: "I cannot control my emotions",
      },
      {
        icon: "pensive",
        text: "I'm letting things bring me down",
      },
    ],
    thoughts_attributes: [
      {
        icon: "expressionless",
        text: "I just don't want to do anything",
      },
      {
        icon: "weary",
        text: "It's just too hard",
      },
      {
        icon: "disappointed",
        text: "I'm a failure",
      },
      {
        icon: "confounded",
        text: "I don't have what it takes to succeed",
      },
      {
        icon: "sweat",
        text: "No one can help me",
      },
    ],
    feelings_attributes: [
      {
        icon: "rage",
        text: "Angry",
      },
      {
        icon: "worried",
        text: "Worried",
      },
      {
        icon: "sweat",
        text: "Anxious",
      },
      {
        icon: "disappointed_relieved",
        text: "Nervous",
      },
      {
        icon: "disappointed",
        text: "Sad",
      },
      {
        icon: "fearful",
        text: "Scared",
      },
      {
        icon: "angry",
        text: "Mad",
      },
      {
        icon: "slight_smile",
        text: "Okay",
      },
      {
        icon: "upside_down",
        text: "Content",
      },
    ],
    concerns_attributes: [
      {
        icon: "triumph",
        text: "I'll yell at someone important to me",
      },
      {
        icon: "weary",
        text: "I’ll lose my friend",
      },
      {
        icon: "angry",
        text: "I'll hurt someone I care about",
      },
      {
        icon: "writing_hand",
        text: "I'll skip school",
      },
      {
        icon: "frowning2",
        text: "I'll do a bad job",
      },
    ],
    positive_thoughts_attributes: [
      {
        icon: "nerd",
        text: "I have the talents and abilities to succeed",
      },
      {
        icon: "smile",
        text: "I will work hard and improve",
      },
      {
        icon: "sunglasses",
        text: "I see myself reaching my goals",
      },
    ],
    positive_behaviors_attributes: [
      {
        icon: "handshake",
        text: "Ask for help from an adult",
      },
      {
        icon: "thumbsup",
        text: "Make a plan # (to study, to prepare, to fix something)",
      },
      {
        icon: "hugging",
        text: "Say I'm sorry",
      },
      {
        icon: "raised_hand",
        text: "Stop behaviors that keep you from succeeding",
      },
      {
        icon: "grin",
        text: "Practice positive self-talk"
      },
    ]
  )
end
