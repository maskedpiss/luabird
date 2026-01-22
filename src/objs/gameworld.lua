local GameWorld = {}

function GameWorld:load()
  self.ScoreBoard = {
      font = Globals.Graphics.Fonts.TitleFont,
      x = 0,
      y = 50
  }
end


function GameWorld:update(dt)
  
end


function GameWorld:draw()
  love.graphics.setColor(Globals.Graphics.black)
  love.graphics.setFont(self.ScoreBoard.font)
  love.graphics.printf(Globals.playerScore, self.ScoreBoard.x, self.ScoreBoard.y, Globals.Screen.width, "center")
end

return GameWorld
