# frozen_string_literal: true
class CurrentActivity
  include ActiveModel::Model

  attr_accessor :id, :category_id, :challenge_id, :thought_id, :feeling_id, :concern_id,
                :positive_thought_id, :positive_behavior_id, :completed

  def category
    Category.find(category_id)
  end

  def challenge
    category.challenges.find_by(id: challenge_id)
  end

  def thought
    category.thoughts.find_by(id: thought_id)
  end

  def feeling
    category.feelings.find_by(id: feeling_id)
  end

  def concern
    category.concerns.find_by(id: concern_id)
  end

  def positive_thought
    category.positive_thoughts.find_by(id: positive_thought_id)
  end

  def positive_behavior
    category.positive_behaviors.find_by(id: positive_behavior_id)
  end
end
