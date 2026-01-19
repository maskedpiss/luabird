Globals = {}
Globals.GameWorld = nil
Globals.Player = nil
Globals.Collisions = require("src/utils/collisions")

local player = nil

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
  player = Globals.Player.new()
end


function love.update(dt)
  Globals.GameWorld:update(dt)
  player:update(dt)
  
  if Globals.Collisions:AABB(player, Globals.GameWorld.Ground) then
    player.y = Globals.GameWorld.Ground.y - player.height
  end
end


function love.draw()
  Globals.GameWorld:draw()
  player:draw()
end


function love.mousepressed(x, y, button)
  if button == 1 then
    Globals.Player:flap()
  end
end
