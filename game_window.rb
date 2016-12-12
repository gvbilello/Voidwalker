require_relative 'player'

class GameWindow < Gosu::Window

  def initialize(width = 640, height = 640, fullscreen = false)
    super
    self.caption = "Voidwalker"
    @background_image = Gosu::Image.new('media/scifi_dungeon.png', :tileable => true)
    @player = Player.new(self)
  end

  def button_down(id)
    # to change, should change to MenuState when Escape key is pressed
  	close if id == Gosu::KbEscape
  end

  def update
  	@player.update
  end

  def draw
  	@background_image.draw(0, 0, 0)
  	@player.draw
  end

end