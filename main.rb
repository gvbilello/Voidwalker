# require 'gosu'

# require_relative 'cell'
# require_relative 'dungoen'

# require 'pry'
# require 'pry-byebug'

# require_relative 'game_window'

# window = GameWindow.new
# window.show

require_relative 'cell'
require_relative 'dungeon'

require 'rubygems'
require 'gosu'
require 'pry'
require 'pry-byebug'

class MazeWindow < Gosu::Window

  def initialize(height = 820, width = 820, fullscreen = false)
    super
    @cell_width = 20
    @dungeon = Dungeon.new(height: (self.height - 20) / @cell_width, width: (self.width - 20) / @cell_width)
    @dungeon.create_dungeon
    @dungeon.create_maze
    @dungeon_cells = @dungeon.dungeon
  end

  def button_down(id)
  	close if id == Gosu::KbEscape
  end

  def update
  end

  # need to creat functions to create game objects (floor tiles, wall tiles, door tiles, etc.) and give those objects a state declaring whether or not the player character can interact with those items.  Ex: walls and other items will be impassable.  Instead of the using (x, y) position variables to determine if the player can continue moving in a certain direction, a function can be created to compare the tile the character is currently on with the tile the player is attempting to move to, prohibiting movement if necessary.  This method can also allow for other interactable tiles (ex. doors, stairs, items, etc.) to have a state telling the game what to do when the player character interacts with them.

  # code to draw and display maze with Gosu below

  # def draw
  # 	@dungeon_cells.each do |row|
  #     row.each do |cell|
  #       w = @cell_width
  #       x = cell.x * w + 10
  #       y = cell.y * w + 10
  #       c = 0xff_ffffff
  #       # draw top wall
  #       if cell.walls[0]
  #         draw_line(x, y, c, x + w, y, c, 1)
  #       end
  #       # draw right wall
  #       if cell.walls[1]
  #         draw_line(x + w, y, c, x + w, y + w, c, 1)
  #       end
  #       # draw bottom wall
  #       if cell.walls[2]
  #         draw_line(x + w, y + w, c, x, y + w, c, 1)
  #       end
  #       # draw left wall
  #       if cell.walls[3]
  #         draw_line(x, y + w, c, x, y, c, 1)
  #       end
  #     end
  #   end
  # end

end

window = MazeWindow.new
window.show
