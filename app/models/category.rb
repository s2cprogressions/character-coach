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
      __send__(col).split("\n") #.map{ |line| line[/(?<=:\w+).*/] }
    end

    define_method :"#{col}_emojis" do
      __send__(col).split("\n").map{ |line| line[/^:\w+:/] }
    end
  end
end
