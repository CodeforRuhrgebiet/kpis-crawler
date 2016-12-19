class Meetup
  def self.stats
    url = "https://api.meetup.com/#{ENV['MEETUP_GROUP_SLUG']}?&sign=true&photo-host=public&only=members&key=#{ENV['MEETUP_API_KEY']}"
    api_result = JSON.load(open(url))
    { members_count: api_result['members'] }
  end
end
