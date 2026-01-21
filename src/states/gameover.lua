local GameOver = {}

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
end


function GameOver.update(dt)
  
end


function GameOver.draw()
  love.graphics.setColor(0, 0, 0)
  love.graphics.setFont(GameOver.Message.font)
  love.graphics.printf(GameOver.Message.text, GameOver.Message.x, GameOver.Message.y, Globals.Screen.width, "center")
  
  love.graphics.setFont(GameOver.Score.font)
  love.graphics.printf(Globals.playerScore, GameOver.Score.x, GameOver.Score.y, Globals.Screen.width, "center")
end


function GameOver.onExit()
  
end

return GameOver
