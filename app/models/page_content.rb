class PageContent < ApplicationRecord
  REQUIRED_CONTENT = {
    emergency_contact: :text,
    general_disclaimer: :text,
  }.with_indifferent_access.freeze

  self.inheritance_column = nil

  before_destroy :validate_destructible

  validates :key, uniqueness: true, presence: true

  def self.text(key)
    find_by!(key: key.to_s)
  end

  def self.missing_content
    REQUIRED_CONTENT.except(*pluck(:key))
  end

  def validate_destructible
    if required?
      errors.add(:base, "Cannot delete required content.")
      throw(:abort)
    end
  end

  def required?
    REQUIRED_CONTENT.keys.include?(key)
  end
end
