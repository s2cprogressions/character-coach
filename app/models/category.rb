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
      __send__(col).split("\n").map do |line|
        emoji = line[EMOJI_REGEX]
        line.slice(emoji.size..-1).strip
      end
    end

    define_method :"#{col}_emojis" do
      __send__(col).split("\n").map { |line| line[EMOJI_REGEX] }
    end
  end

  has_many :challenges, -> { where(type: "challenge").order(index: :asc) }, class_name: "CategoryOption"
  has_many :feelings, -> { where(type: "feeling").order(index: :asc) }, class_name: "CategoryOption"
  has_many :thoughts, -> { where(type: "thought").order(index: :asc) }, class_name: "CategoryOption"
  has_many :concerns, -> { where(type: "concern").order(index: :asc) }, class_name: "CategoryOption"
  has_many :positive_thoughts, -> { where(type: "positive_thought").order(index: :asc) }, class_name: "CategoryOption"
  has_many :positive_behaviors, -> { where(type: "positive_behavior").order(index: :asc) }, class_name: "CategoryOption"

  accepts_nested_attributes_for :challenges, :feelings, :thoughts, :concerns,
                                :positive_thoughts, :positive_behaviors,
                                allow_destroy: true,
                                reject_if: :all_blank
end
