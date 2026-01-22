local Menu = {}

local bg = nil
local playButton = nil
local exitButton = nil
local savedScore = nil

function Menu.onEnter()
  Menu.getScore()
  
  Globals.BackGround = require("src/objs/background")
  bg = Globals.BackGround.new()
  
  Menu.Title = {
      font = Globals.Graphics.Fonts.TitleFont,
      x = Globals.Screen.x,
      y = 50,
      text = "lua bird"
  }
  
  Menu.HiScore = {
      font = Globals.Graphics.Fonts.HiScoreFont,
      x = Globals.Screen.x,
      y = 125
  }
  
  local playBtnX = Globals.Screen.width / 2
  local playBtnY = Globals.Screen.height / 2
  local exitBtnX = playBtnX
  local exitBtnY = playBtnY + 75
  
  Globals.Button = require("src/objs/button")
  playButton = Globals.Button.new(Globals.Graphics.Sprites.playButton, playBtnX - Globals.Button.offset, playBtnY, function()
      GameState:changeState("play")
  end)
  
  exitButton = Globals.Button.new(Globals.Graphics.Sprites.exitButton, exitBtnX - Globals.Button.offset, exitBtnY, function()
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
  bg:draw()
  
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
  bg = nil
  Menu.BackGround = {}
  Menu.Title = {}
  Menu.HiScore = {}
  Globals.Button = nil
  Globals.BackGround = nil
end

return Menu
