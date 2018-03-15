class StatsCollector
  class Facebook
    MYSQL_TABLE = 'facebook_page'.freeze

    require 'nokogiri'

    def stats
      page = Nokogiri::HTML(open(ENV['FACEBOOK_SHAREBUTTON_URL']))

      likes_count = nil
      page.css('span').each do |n|
        next if n.text.empty?
        next unless string_is_integer?(n.text)
        likes_count = n.text.to_i
      end

      { likes_count: likes_count }
    end

    private

    def string_is_integer?(string)
      !!(string =~ /\A[-+]?[0-9]+\z/)
    end
  end
end
