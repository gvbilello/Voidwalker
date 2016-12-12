require_relative 'helpers'

class Player

  include Helpers

  SPRITE = Helpers.media_path('player-large.png')
  FRAME_DELAY = 90

  def load_animation(window)
    Gosu::Image.load_tiles(window, SPRITE, 32, 32, false)
  end

  def initialize(window)
    @window = window
    @player = load_animation(@window)
    @x_position = @window.height / 2
    @y_position = @window.height / 2
    @direction = :down
    @previous_frame = 0
    @current_frame = 1
  end

  def can_move_left?
    return true if @x_position > 24
  end

  def can_move_right?
    return true if @x_position < 588
  end

  def can_move_up?
    return true if @y_position > 44
  end

  def can_move_down?
    return true if @y_position < 586
  end

  def move_right
    if @window.button_down?(Gosu::KbRight) && can_move_right?
      if @direction == :right
        @x_position += 4
      else
        @direction = :right
        @previous_frame = 6
        @current_frame = 7
      end

      if frame_expired?
        if @previous_frame == 6 && @current_frame == 7
          @previous_frame = @current_frame
          @current_frame = 8
        elsif @previous_frame == 8 && @current_frame == 7
          @previous_frame = @current_frame
          @current_frame = 6
        elsif @current_frame == 6
          @previous_frame = @current_frame
          @current_frame = 7
        elsif @current_frame == 8
          @previous_frame = @current_frame
          @current_frame = 7
        end
      end
    end
  end

  def move_left
    if @window.button_down?(Gosu::KbLeft) && can_move_left?
      if @direction == :left
        @x_position -= 4
      else
        @direction = :left
        @previous_frame = 3
        @current_frame = 4
      end
      
      if frame_expired?
        if @previous_frame == 3 && @current_frame == 4
          @previous_frame = @current_frame
          @current_frame = 5
        elsif @previous_frame == 5 && @current_frame == 4
          @previous_frame = @current_frame
          @current_frame = 3
        elsif @current_frame == 3
          @previous_frame = @current_frame
          @current_frame = 4
        elsif @current_frame == 5
          @previous_frame = @current_frame
          @current_frame = 4
        end
      end
    end
  end

  def move_up
    if @window.button_down?(Gosu::KbUp) && can_move_up?
      if @direction == :up
        @y_position -= 4
      else
        @direction = :up
        @previous_frame = 9
        @current_frame = 10
      end
      
      if frame_expired?
        if @previous_frame == 9 && @current_frame == 10
          @previous_frame = @current_frame
          @current_frame = 11
        elsif @previous_frame == 11 && @current_frame == 10
          @previous_frame = @current_frame
          @current_frame = 9
        elsif @current_frame == 9
          @previous_frame = @current_frame
          @current_frame = 10
        elsif @current_frame == 11
          @previous_frame = @current_frame
          @current_frame = 10
        end
      end
    end
  end

  def move_down
    if @window.button_down?(Gosu::KbDown) && can_move_down?
      if @direction == :down
        @y_position += 4
      else
        @direction = :down
        @previous_frame = 0
        @current_frame = 1
      end
      
      if frame_expired?
        if @previous_frame == 0 && @current_frame == 1
          @previous_frame = @current_frame
          @current_frame = 2
        elsif @previous_frame == 2 && @current_frame == 1
          @previous_frame = @current_frame
          @current_frame = 0
        elsif @current_frame == 0
          @previous_frame = @current_frame
          @current_frame = 1
        elsif @current_frame == 2
          @previous_frame = @current_frame
          @current_frame = 1
        end
      end
    end
  end

  def update
    move_right
    move_left
    move_up
    move_down
  end

  def draw
    current_frame.draw(@x_position, @y_position, 1)
    @info = Gosu::Image.from_text(@window, info, Gosu.default_font_name, 30)
    @info.draw(0, 0, 1)
  end

  private

  def info
    "x:#{@x_position} y:#{@y_position}"
  end

  def current_frame
    @player[@current_frame]
  end

  def frame_expired?
    now = Gosu.milliseconds
    @last_frame ||= now
    if (now - @last_frame) > FRAME_DELAY
      @last_frame = now
    end
  end

end