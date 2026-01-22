local GameWorld = {}

function GameWorld:load()
  self.Ground = {
      sprite = Globals.Graphics.Sprites.ground,
      x = Globals.Screen.x,
      y = Globals.Screen.height - 112,
      width = Globals.Screen.width,
      height = Globals.Screen.height
  }
  
  self.ScoreBoard = {
      font = Globals.Graphics.Fonts.TitleFont,
      x = 0,
      y = 50
  }
end


function GameWorld:update(dt)
  
end


function GameWorld:draw()
  love.graphics.setColor(Globals.Graphics.white)
  love.graphics.draw(self.Ground.sprite, self.Ground.x, self.Ground.y)
  
  love.graphics.setColor(Globals.Graphics.black)
  love.graphics.setFont(self.ScoreBoard.font)
  love.graphics.printf(Globals.playerScore, self.ScoreBoard.x, self.ScoreBoard.y, Globals.Screen.width, "center")
end

return GameWorld
