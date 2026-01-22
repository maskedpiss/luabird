local Play = {}

local bg = nil
local ground = nil
local player = nil
local pipe = nil

function Play.onEnter()
  Globals.BackGround = require("src/objs/background")
  bg = Globals.BackGround.new()
  
  Globals.Ground = require("src/objs/ground")
  ground = Globals.Ground.new()
  
  Globals.GameWorld = require("src/objs/gameworld")
  Globals.GameWorld:load()
  
  Globals.Player = require("src/objs/player")
  player = Globals.Player.new()
  
  Globals.Pipe = require("src/objs/pipe")
  pipe = Globals.Pipe.new()
end


function Play.update(dt)
  Globals.GameWorld:update(dt)
  bg:update(dt)
  player:update(dt)
  pipe:update(dt)
  
  if player.x > pipe.TopPipe.x + pipe.TopPipe.width and Globals.hasScored == false then
    Globals.playerScore = Globals.playerScore + 1
    Globals.hasScored = true
  end
  
  if Globals.Collisions:AABB(player, pipe.TopPipe) or Globals.Collisions:AABB(player, pipe.BottomPipe) or Globals.Collisions:AABB(player, ground) then
    GameState:changeState("gameOver")
  end
end


function Play.mousepressed(x, y, button)
  if button == 1 then
    player:flap()
  end
end


function Play.draw()
  bg:draw()
  pipe:draw()
  ground:draw()
  Globals.GameWorld:draw()
  player:draw()
end


function Play.onExit()
  player = nil
  pipe = nil
  bg = nil
  Globals.GameWorld = nil
  Globals.Player = nil
  Globals.Pipe = nil
  Globals.BackGround = nil
end

return Play
