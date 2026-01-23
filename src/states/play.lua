local Play = {}

local bg = nil
local ground = nil
local player = nil
local pipe = nil
local scoreBoard = nil

function Play.onEnter()
  Globals.BackGround = require("src/objs/background")
  bg = Globals.BackGround.new()
  
  Globals.Ground = require("src/objs/ground")
  ground = Globals.Ground.new()
  
  scoreBoard = {
      font = Globals.Graphics.Fonts.TitleFont,
      x = 0,
      y = 50
  }
  
  Globals.Player = require("src/objs/player")
  player = Globals.Player.new()
  
  Globals.Pipe = require("src/objs/pipe")
  pipe = Globals.Pipe.new()
end


function Play.update(dt)
  bg:update(dt)
  ground:update(dt)
  player:update(dt)
  pipe:update(dt)
  
  if player.x > pipe.TopPipe.x + pipe.TopPipe.width and Globals.hasScored == false then
    Globals.playerScore = Globals.playerScore + 1
    Globals.Sound:playSound(Globals.Sound.goal)
    Globals.hasScored = true
  end
  
  if Globals.Collisions:AABB(player, pipe.TopPipe) or Globals.Collisions:AABB(player, pipe.BottomPipe) then
    GameState:changeState("gameOver")
  end
  
  if player and player.y + player.height > Globals.Screen.height - ground.height then
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
  player:draw()
  
  love.graphics.setColor(Globals.Graphics.black)
  love.graphics.setFont(scoreBoard.font)
  love.graphics.printf(Globals.playerScore, scoreBoard.x, scoreBoard.y, Globals.Screen.width, "center")
end


function Play.onExit()
  player = nil
  pipe = nil
  bg = nil
  Globals.Player = nil
  Globals.Pipe = nil
  Globals.BackGround = nil
end

return Play
