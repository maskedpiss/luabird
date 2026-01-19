Globals = {}
Globals.GameWorld = nil
Globals.Player = nil
Globals.Collisions = require("src/utils/collisions")

function love.load()
  Globals.Screen = {
      x = 0,
      y = 0,
      width = love.graphics.getWidth(),
      height = love.graphics.getHeight()
  }
  
  Globals.GameWorld = require("src/objs/gameworld")
  Globals.GameWorld:load()
  
  Globals.Player = require("src/objs/player")
  Globals.Player:load()
end


function love.update(dt)
  Globals.GameWorld:update(dt)
  Globals.Player:update(dt)
  
  if Globals.Collisions:AABB(Globals.Player, Globals.GameWorld.Ground) then
    Globals.Player.y = Globals.GameWorld.Ground.y - Globals.Player.height
  end
end


function love.draw()
  Globals.GameWorld:draw()
  Globals.Player:draw()
end
