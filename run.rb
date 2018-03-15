require 'open-uri'

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |f| require f }
Dir[File.join('.', 'lib/**/*.rb')].each { |f| require f }

stats = StatsCollector.new
stats.fetch
stats.save
