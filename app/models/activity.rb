class Activity
  include ActiveModel::Model

  attr_accessor :id, :title, :challenges, :thoughts, :feelings, :concerns,
                :positive_thoughts, :positive_behaviors

  def self.repository
    YAML.load_file(Rails.root.join("config", "model.yml"))
  end

  def self.globals
    repository["globals"]
  end

  def self.categories
    repository["categories"].map do |id, category|
      globals.each do |key, value|
        category["id"] = id
        category[key] += value
      end
      ActivityOption::TYPES.each do |option_type|
        category[option_type.pluralize] = category[option_type.pluralize].map do |value_attrs|
          identifiers = [category["id"], option_type, value_attrs["text"]].join(":")
          value_attrs["id"] = Digest::MD5.hexdigest(identifiers)
          value_attrs["type"] = option_type
          ActivityOption.new(value_attrs)
        end
      end
      category
    end
  end

  def self.activities
    categories.map do |category|
      new(category)
    end
  end

  def self.activity(id)
    activities.index_by(&:id)[id.to_s]
  end
end
