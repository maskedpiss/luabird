local Menu = {}

local playButton = nil
local exitButton = nil
local savedScore = nil

function Menu.onEnter()
  Menu.getScore()
  
  Menu.Title = {
      font = love.graphics.newFont(64),
      x = Globals.Screen.x,
      y = 50,
      text = "Lua Bird"
  }
  
  Menu.HiScore = {
      font = love.graphics.newFont(48),
      x = Globals.Screen.x,
      y = 125
  }
  
  local playBtnX = Globals.Screen.width / 2
  local playBtnY = Globals.Screen.height / 2
  local exitBtnX = playBtnX
  local exitBtnY = playBtnY + 75
  
  Globals.Button = require("src/objs/button")
  playButton = Globals.Button.new("Play", playBtnX - Globals.Button.offset, playBtnY, function()
      GameState:changeState("play")
  end)
  
  exitButton = Globals.Button.new("Exit", exitBtnX - Globals.Button.offset, exitBtnY, function()
      love.event.quit()
  end)
end


function Menu.update(dt)
  
end


function Menu.mousepressed(x, y, button)
  if playButton:mousepressed(x, y, button) then
    return
  end
  
  if exitButton:mousepressed(x, y, button) then
    return
  end
end


function Menu.getScore()
  if love.filesystem.getInfo("highscores.txt") then
    savedScore = love.filesystem.read("highscores.txt")
    Globals.hiScore = tonumber(savedScore)
  else
    savedScore = 0
  end
end


function Menu.draw()
  love.graphics.setBackgroundColor(Globals.Graphics.lightBlue)
  
  love.graphics.setColor(Globals.Graphics.black)
  love.graphics.setFont(Menu.Title.font)
  love.graphics.printf(Menu.Title.text, Menu.Title.x, Menu.Title.y, Globals.Screen.width, "center")
  
  love.graphics.setFont(Menu.HiScore.font)
  love.graphics.printf(Globals.hiScore, Menu.HiScore.x, Menu.HiScore.y, Globals.Screen.width, "center")
  
  playButton:draw()
  exitButton:draw()
end


function Menu.onExit()
  playButton = nil
  exitButton = nil
  Menu.Title = {}
  Menu.HiScore = {}
  Globals.Button = nil
end

return Menu
