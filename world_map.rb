class WorldMap

	attr_accessor :on_screen, :off_screen

	def initialize(width, height)
		@images = {}
		(0..width).step(50) do |x|
			@images[x] = {}
			(0..height).step(50) do |y|
				img = Gosu::Image.from_text($window, "#{x}:#{y}", Gosu.default_font_name, 15)
				@images[x][y] = img
			end
		end
	end

	def draw(camera)
		@on_screen = @off_screen = 0
		@images.each do |x, row|
			row.each do |y, val|
				if camera.can_view?(x, y, val)
					val.draw(x, y, 0)
					@on_screen += 1
				else
					@off_screen += 1
				end
			end
		end
	end

end