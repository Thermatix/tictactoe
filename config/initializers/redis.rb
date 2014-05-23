if Rails.env.production?
	port = 9994
else
	port = 6379
end
$redis = Redis.new(host: 'localhost', port:  port )