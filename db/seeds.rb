# coding: utf-8
# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create_with(
  password: Rails.env.development? ? "password" : "sting-din-daydream"
).find_or_create_by!(email: "admin@progressions.us")

PageContent.create_with(
  type: "text",
  text: <<~TEXT
    If you are in the U.S. and feel like you need to talk to someone right away, please call this national helpline:

    1-800-273-8255

    If you are not in the US and you feel like you need to talk to someone right away, please click on the link below for helplines in your area.

    https://en.wikipedia.org/wiki/List_of_emergency_telephone_numbers
  TEXT
).find_or_create_by(key: "emergency_contact")

PageContent.create_with(
  type: "text",
  text: <<~TEXT
    This mobile application is intended to enable youth to make better decisions and think through their problems. Using the advice on this mobile application by no means guarantees change or the solving of problems.

    The creators of this application will accept no responsibility for the users’ choices based off their use of this mobile application.
  TEXT
).find_or_create_by(key: "general_disclaimer")

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
        icon: "disappointed_relieved",
        text: "There is too much pressure",
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
    ],
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
        icon: "frowning2",
        text: "I'll do a bad job",
      },
    ],
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
    ],
  )
end
