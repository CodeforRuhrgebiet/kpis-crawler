class Facebook
  def self.stats
    page = Nokogiri::HTML(open(ENV['FACEBOOK_SHAREBUTTON_URL']))
    likes_count = page.css('.pluginCountTextConnected').text.to_i
    { likes_count: likes_count }
  end
end
