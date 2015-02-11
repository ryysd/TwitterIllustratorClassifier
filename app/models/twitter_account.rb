class TwitterAccount
  include ActiveModel::Model
  include ActiveModel::Callbacks

  attr_writer :raw_data
  attr_reader :description, :url 

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end

    @description = @raw_data[:description]
    @url = @raw_data[:entities][:url][:urls][:expanded_url] rescue nil
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
end
