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

  def self.new_defaults(type, options = {})
    model_data = YAML.load_file(Rails.root.join("config", "model.yml"))
    option_data = model_data.dig("globals", type.to_s.pluralize) || []
    option_data.each.map do |option|
      new(option.merge(type: type.to_s.singularize, **options))
    end
  end
end
