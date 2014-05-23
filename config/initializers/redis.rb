if Rails.env.production?
	port = 9994
	host =  URI.parse(ENV["REDISTOGO_URL"])
else
	port = 6379
	host = 'localhost'
end
$redis = Redis.new(host: host , port:  port )