local Play = {}

local player = nil

function Play.onEnter()
  Globals.GameWorld = require("src/objs/gameworld")
  Globals.GameWorld:load()
  
  Globals.Player = require("src/objs/player")
  player = Globals.Player.new()
end


function Play.update(dt)
  Globals.GameWorld:update(dt)
  player:update(dt)
  
  if Globals.Collisions:AABB(player, Globals.GameWorld.Ground) then
    player.y = Globals.GameWorld.Ground.y - player.height
  end
end


function Play.mousepressed(x, y, button)
  if button == 1 then
    player:flap()
  end
end


function Play.draw()
  Globals.GameWorld:draw()
  player:draw()
end


function Play.onExit()
  
end

return Play
