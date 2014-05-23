if Rails.env.production?
	port = 9994
	host =  URI.parse('redis://redistogo:826b21c287cb32ca1237d5493b8881d3@angelfish.redistogo.com:9994/') #URI.parse(ENV["REDISTOGO_URL"])
else
	port = 6379
	host = 'localhost'
end
$redis = Redis.new(host: host , port:  port )