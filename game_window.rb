require_relative 'player'
require_relative 'coin'

class GameWindow < Gosu::Window

  def initialize(width = 640, height = 640, fullscreen = false)
    super
    self.caption = "Voidwalker"
    @background_image = Gosu::Image.new('media/scifi_dungeon.png', :tileable => true)
    @player = Player.new(self)
    @coins = []
    100.times do
      coin = Coin.new(self)
      @coins << coin
    end
  end

  def button_down(id)
    # to change, should change to MenuState when Escape key is pressed
  	close if id == Gosu::KbEscape
  end

  def update
  	@player.update
    @coins.each do |coin|
      coin.update
      if @player.x_position.between?(coin.x_position - 10, coin.x_position + 28) && @player.y_position.between?(coin.y_position - 10, coin.y_position + 18)
        @player.score += 1
        @coins.delete(coin)
      end
    end
  end

  def draw
  	@background_image.draw(0, 0, 0)
  	@player.draw
    @coins.each { |coin| coin.draw }
  end

end