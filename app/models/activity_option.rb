class ActivityOption
  TYPES = %w(
    challenge
    thought
    feeling
    concern
    positive_thought
    positive_behavior
  ).freeze

  include ActiveModel::Model

  attr_accessor :id, :icon, :text, :description, :type
end
