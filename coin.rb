require_relative 'helpers'

class Coin

	include Helpers

	attr_accessor :x_position, :y_position

	SPRITE = Helpers.media_path('coin.png')
  FRAME_DELAY = 90

  def load_animation(window)
    Gosu::Image.load_tiles(window, SPRITE, 18, 18, false)
  end

  def initialize(window)
    @window = window
    @coin = load_animation(@window)
    @x_position = rand(24..588)
    @y_position = rand(44..586)
    @current_frame = 0
  end

  def update
  	@current_frame += 1 if frame_expired?

  	if @current_frame == 6
  		@current_frame = 0
  	end
  end

  def draw
  	current_frame.draw(@x_position, @y_position, 1)
  end

  private

  def current_frame
    @coin[@current_frame]
  end

  def frame_expired?
    now = Gosu.milliseconds
    @last_frame ||= now
    if (now - @last_frame) > FRAME_DELAY
      @last_frame = now
    end
  end

end