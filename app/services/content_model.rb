CATEGORY_KEYS = %w(
  title
  challenges
  thinking
  feelings
  concerns
  successful_thinking
  successful_feelings
).freeze

# TODO: Make me a real boy
Category = Struct.new(*CATEGORY_KEYS.map(&:to_sym))

class ContentModel
  def self.instance
    @instance ||=
      begin
        path = "#{Rails.root}/config/model.yml"
        content = YAML.load_file(path)
        new(content)
      end
  end

  def initialize(content)
    @content = normalize(content)
  end

  attr_reader :content

  private def normalize(content)
    categories = content["categories"]
    globals = content["globals"]

    categories.each_pair do |_cat_key, cat|
      globals.each_pair do |type_key, type_globals|
        cat_entry = cat[type_key]
        if cat_entry.blank?
          cat_entry = []
          cat[type_key] = cat_entry
        end
        cat_entry.concat type_globals
      end
    end

    categories.freeze
  end

  def category_keys
    @content.keys
  end

  def categories
    category_keys.map(&method(:category_by_key))
  end

  def category_by_key(key)
    entry = @content[key.to_s]
    args = entry.values_at(*CATEGORY_KEYS)
    Category.new(*args)
  end
end
