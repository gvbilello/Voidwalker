class PlayState < GameState

	def initialize
		# @map is new location
		@map = Map.new
		@player = Player.new(@map)
		@camera = Camera.new(@player)
	end

	def update
		@camera.update
	end

	def draw
		cam_x = @camera.x
		cam_y = @camera.y
		off_x = $window.width / 2 - cam_x
		off_y = $window.height / 2 - cam_y
		$window.translate(off_x, off_y) do
			zoom = @camera.zoom
			$window.scale(zoom, zoom, cam_x, cam_y) do
				@map.draw(camera)
				@player.draw
			end
		end
	end

	def button_down(id)
		if id == Gosu::KbEscape
			GameState.switch(MenuState.instance)
		end
	end

end