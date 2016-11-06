class Category < ApplicationRecord
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
