local GameOver = {}

local retryButton = nil
local exitButton = nil

function GameOver.onEnter()
  GameOver.Message = {
      font = love.graphics.newFont(48),
      x = Globals.Screen.x,
      y = 50,
      text = "Game Over!"
  }
  
  GameOver.Score = {
      font = love.graphics.newFont(64),
      x = Globals.Screen.x,
      y = 125
  }
  
  local retryBtnX = Globals.Screen.width / 2
  local retryBtnY = Globals.Screen.height / 2
  local exitBtnX = retryBtnX
  local exitBtnY = retryBtnY + 75
  
  Globals.Button = require("src/objs/button")
  retryButton = Globals.Button.new("Retry", retryBtnX, retryBtnY, function()
      GameState:changeState("play")
  end)

  exitButton = Globals.Button.new("Exit", exitBtnX, exitBtnY, function()
      love.event.quit()
  end)
end


function GameOver.update(dt)
  
end


function GameOver.draw()
  love.graphics.setColor(0, 0, 0)
  love.graphics.setFont(GameOver.Message.font)
  love.graphics.printf(GameOver.Message.text, GameOver.Message.x, GameOver.Message.y, Globals.Screen.width, "center")
  
  love.graphics.setFont(GameOver.Score.font)
  love.graphics.printf(Globals.playerScore, GameOver.Score.x, GameOver.Score.y, Globals.Screen.width, "center")
  
  retryButton:draw()
  exitButton:draw()
end


function GameOver.onExit()
  
end

return GameOver
