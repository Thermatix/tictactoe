if Rails.env.production?
	# port = 9994
	uri = URI.parse(ENV["REDISTOGO_URL"])
else
	port = 6379
	host = 'localhost'
end
$redis = Redis.new(host: uri.host || host, port: uri.port || port, password: uri.password || nil)
Resque.redis = $redis