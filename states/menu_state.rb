require 'singleton'
require_relative 'GameState'

class MenuState < GameState

	include Singelton

	attr_accessor :play_state

	def initialize
		@message = Gosu::Image.from_text($window, "Voidwalker", Gosu.default_font_name, 100)
	end

	def enter
		music.play(true)
		music.volume = 1
	end

	def leave
		music.volume = 0
		music.stop
	end

	def music
		# @@music ||= Gosu::Song.new($window, Helpers.media_path('menu_music.mp3'))
	end

	def update
		continue_text = @play_state ? "C = Continue, " : ""
		@info = Gosu::Image.from_text($window, "Q = Quit, #{continue_text}, N = New Game", Gosu.default_font_name, 30)
	end

	def draw
		message_x_position = $window.width / 2 - @message.width / 2
		message_y_position = $window.height / 2 - @message.height / 2
		info_x_position = $window.width / 2 - @info.width / 2
		info_y_position = $window.height / 2 - @info.height / 2 + 200
		@message.draw(message_x_position, message_y_position, 10)
		@info.draw(info_x_position, info_y_position, 10)
	end

	def button_down(id)
		$window.close if id == Gosu::KbQ
		if id == Gosu::KbC && @play_state
			GameState.switch(@play_state)
		end
		if id == Gosu::KbN
			@play_state = PlayState.new
			GameState.switch(@play_state)
		end
	end

end