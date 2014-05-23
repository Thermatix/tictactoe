require 'awesome_print'
require 'json'
class Grid
	attr_accessor  :grid, :ip, :errors

	def initialize ip=nil
		self.ip = ip
		if self.ip
			load self.ip
		else
			self.grid = begin
				returning = {}
				for row in 1..3 do
					returning[row.to_s] = {}
					for collum in 1..3 do
						returning[row.to_s][collum.to_s] = 'e'
					end
				end
				returning
			end
		end
	end

	def to_json
		self.grid.to_json
	end

	def save
		if self.ip
			data = self.grid.to_json
			if $redis.set(self.ip , data) == 'OK'
				return true
			else
				self.errors = "Couldn't save Grid"
				return false
			end
		else
			raise "can't save without an ip"
		end
	end

	def load ip
		self.grid = JSON.parse(find_by ip)
	end

	private
		def find_by ip
			if ip
				$redis.get ip
			end
		end

end