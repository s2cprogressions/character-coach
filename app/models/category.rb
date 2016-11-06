class Category < ApplicationRecord
  EMOJI_REGEX = /^:\w+:/
  %w(
    challenges
    thinking
    feelings
    concerns
    positive_thoughts
    positive_behaviors
  ).each do |col|
    define_method :"#{col}_titles" do
      __send__(col).split("\n").map{ |line|
        emoji = line[EMOJI_REGEX]
        line.slice(emoji.size..-1).strip
      }
    end

    define_method :"#{col}_emojis" do
      __send__(col).split("\n").map{ |line| line[EMOJI_REGEX] }
    end
  end
end
