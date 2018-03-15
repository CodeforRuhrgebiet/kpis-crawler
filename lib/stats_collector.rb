class StatsCollector
  require 'mysql2'

  def fetch
    @mailinglist = Mailinglist.new.stats
    @meetup = Meetup.new.stats
    @twitter = TwitterAccount.new.stats
    @facebook = Facebook.new.stats
  end

  def save
    @db = Mysql2::Client.new(host: ENV['MYSQL_HOST'],
                             username: ENV['MYSQL_USER'],
                             password: ENV['MYSQL_PASSWORD'],
                             database: ENV['MYSQL_DATABASE'])

    save_to_table(Mailinglist::MYSQL_TABLE, @mailinglist)
    save_to_table(Meetup::MYSQL_TABLE, @meetup)
    save_to_table(TwitterAccount::MYSQL_TABLE, @twitter)
    save_to_table(Facebook::MYSQL_TABLE, @facebook)
  end

  def save_to_table(table, data)
    rows = data.keys.map(&:to_s)
    cell_data = data.values.map { |v| escape_value(v) }

    query = "INSERT INTO #{table} (#{rows.join(', ')}) " \
            "VALUES (#{cell_data.join(', ')})"

    @db.query(query)
  end

  private

  def escape_value(value)
    return value if value.is_a?(Integer)
    Mysql2::Client.escape(value)
  end
end
