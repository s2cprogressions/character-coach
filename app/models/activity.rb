class Activity
  include ActiveModel::Model

  attr_accessor :id, :title, :challenges, :thinking, :feelings, :concerns,
                :successful_thinking, :successful_behaviors, :about

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
