# frozen_string_literal: true
class Category < ApplicationRecord
  has_many :challenges, -> { where(type: "challenge").order(index: :asc) }, class_name: "CategoryOption", dependent: :destroy
  has_many :feelings, -> { where(type: "feeling").order(index: :asc) }, class_name: "CategoryOption", dependent: :destroy
  has_many :thoughts, -> { where(type: "thought").order(index: :asc) }, class_name: "CategoryOption", dependent: :destroy
  has_many :concerns, -> { where(type: "concern").order(index: :asc) }, class_name: "CategoryOption", dependent: :destroy
  has_many :positive_thoughts, -> { where(type: "positive_thought").order(index: :asc) }, class_name: "CategoryOption", dependent: :destroy
  has_many :positive_behaviors, -> { where(type: "positive_behavior").order(index: :asc) }, class_name: "CategoryOption", dependent: :destroy

  accepts_nested_attributes_for :challenges, :feelings, :thoughts, :concerns,
                                :positive_thoughts, :positive_behaviors,
                                allow_destroy: true,
                                reject_if: :all_blank

  after_initialize :generate_defaults, if: :new_record?

  private

  def generate_defaults
    self.challenges = CategoryOption.new_defaults(:challenge, category: self)
    self.thoughts = CategoryOption.new_defaults(:thought, category: self)
    self.feelings = CategoryOption.new_defaults(:feeling, category: self)
    self.concerns = CategoryOption.new_defaults(:concern, category: self)
    self.positive_thoughts = CategoryOption.new_defaults(:positive_thought, category: self)
    self.positive_behaviors = CategoryOption.new_defaults(:positive_behavior, category: self)
  end
end
