class GridsController < ApplicationController
	respond_to :html, :js

	def index

	end

	def show

	end

	def create
		@grid = Grid.new()
		@grid.ip = request.remote_ip
		ap @grid
		respond_with @grid do |format|
			if @grid.save
				format.html {redirect_to show_grid_path}
				format.js {render layout: false }
			else
				format.html {redirect_to error_path}
				format.js #{action: 'error'}
			end
		end
	end

	def update
		@grid = Grid.new(request.ip)
		@collum = params['collum']
		@row = params['row']
		@player = params['player']
		@grid.grid[@collum][@row] = @player
		respond_with @grid do |format|
			if @grid.save
				format.html {redirect_to show_grid_path}
				format.js {render layout: false }
			else
				format.html {redirect_to error_path}
				format.js {@grid}#{action: 'error'}
			end
		end

	end

	def destroy

	end
end