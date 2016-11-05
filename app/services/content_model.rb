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

  def normailze(content)
    # categories = content['categories']
    # globals = content['globals']
    # categories.each_pair do |cat|
    #   globals.each_pair do |type_key, type_globals|
    #   end
    # end
  end
end
