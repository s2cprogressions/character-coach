class CategoryOption < ApplicationRecord
  TYPES = %w(
    challenge
    thought
    feeling
    concern
    positive_thought
    positive_behavior
  ).freeze

  self.inheritance_column = nil

  belongs_to :category

  TYPES.each do |type|
    scope type.pluralize.to_sym, -> { where(type: type) }
  end
end
