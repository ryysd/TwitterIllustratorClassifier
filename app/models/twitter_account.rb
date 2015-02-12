class TwitterAccount
  include ActiveModel::Model
  include ActiveModel::Callbacks

  attr_writer :raw_data
  attr_reader :description, :url 

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end

    @name = @raw_data[:name]
    @description = @raw_data[:description]
    @screen_name = @raw_data[:screen_name]
    @url = @raw_data[:entities][:url][:urls][:expanded_url].to_s rescue nil
    @profile_image_url = @raw_data[:profile_image_url].to_s.gsub 'normal', 'bigger'
  end

  def url_include_pixiv_url?
    !@url.nil? && (@url.include? 'http://www.pixiv.net')
  end

  def description_mention_illust?
    keywords = ['pixiv.net', 'イラスト', '絵']
    !@description.nil? && keywords.any?{|key| @description.include? key}
  end

  def is_illustrator?
    url_include_pixiv_url? || description_mention_illust?
  end

  def as_json options = {}
    super :only => ['name', 'screen_name', 'profile_image_url']
  end
end
