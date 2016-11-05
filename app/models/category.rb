class Category < ApplicationRecord


  %w(
    challenges
    thinking
    feelings
    concerns
    positive_thoughts
    positive_behaviors
  ).each do |col|
    define_method :"#{col}_titles" do
      __send__(col).split("\n")
    end

    define_method :"#{col}_emojis" do
      [":smile:"] * __send__(col).split("\n").size
    end
  end
end
