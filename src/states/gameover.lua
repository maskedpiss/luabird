local GameOver = {}

local bg = nil
local retryButton = nil
local exitButton = nil

function GameOver.onEnter()
  GameOver.checkScore(Globals.playerScore)
  
  Globals.BackGround = require("src/objs/background")
  bg = Globals.BackGround.new()
  
  GameOver.Message = {
      font = Globals.Graphics.Fonts.HiScoreFont,
      x = Globals.Screen.x,
      y = 50,
      text = "game over!"
  }
  
  GameOver.Score = {
      font = Globals.Graphics.Fonts.TitleFont,
      x = Globals.Screen.x,
      y = 125
  }
  
  local retryBtnX = Globals.Screen.width / 2
  local retryBtnY = Globals.Screen.height / 2
  local exitBtnX = retryBtnX
  local exitBtnY = retryBtnY + 75
  
  Globals.Button = require("src/objs/button")
  --retryButton = Globals.Button.new(Globals.Graphics.Sprites.retryButton, retryBtnX - Globals.Button.offset, retryBtnY, function()
      --GameState:changeState("play")
  --end)

  --exitButton = Globals.Button.new(Globals.Graphics.Sprites.exitButton, exitBtnX - Globals.Button.offset, exitBtnY, function()
      --love.event.quit()
  --end)
end


function GameOver.update(dt)
  bg:update(dt)
end


function GameOver.mousepressed(x, y, button)
  if retryButton:mousepressed(x, y, button) then
    return
  end
  
  if exitButton:mousepressed(x, y, button) then
    return
  end
end


function GameOver.checkScore(newScore)
  if newScore > Globals.hiScore then
    Globals.hiScore = newScore
    saveHighScore()
  end
end


function GameOver.draw()
  bg:draw()
  
  love.graphics.setColor(Globals.Graphics.black)
  love.graphics.setFont(GameOver.Message.font)
  love.graphics.printf(GameOver.Message.text, GameOver.Message.x, GameOver.Message.y, Globals.Screen.width, "center")
  
  love.graphics.setFont(GameOver.Score.font)
  love.graphics.printf(Globals.playerScore, GameOver.Score.x, GameOver.Score.y, Globals.Screen.width, "center")
  
  --retryButton:draw()
  --exitButton:draw()
end


function GameOver.onExit()
  GameOver.Message = {}
  GameOver.Score = {}
  Globals.Button = nil
  retryButton = nil
  exitButton = nil
  bg = nil
  Globals.BackGround = nil
  Globals.playerScore = 0
end

return GameOver
