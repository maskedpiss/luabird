local GameWorld = {}

function GameWorld:load()
  self.BG = { 0, 0.59, 1 }
  self.Ground = {
      x = Globals.Screen.x,
      y = Globals.Screen.height - 112,
      width = Globals.Screen.width,
      height = Globals.Screen.height
  }
  
  self.ScoreBoard = {
      font = love.graphics.newFont(64),
      x = 0,
      y = 50
  }
end


function GameWorld:update(dt)
  
end


function GameWorld:draw()
  love.graphics.setBackgroundColor(self.BG)
  
  love.graphics.setColor(0.24, 1, 0.24)
  love.graphics.rectangle("fill", self.Ground.x, self.Ground.y, self.Ground.width, self.Ground.height)
  
  love.graphics.setColor(0, 0, 0)
  love.graphics.setFont(self.ScoreBoard.font)
  love.graphics.printf(Globals.playerScore, self.ScoreBoard.x, self.ScoreBoard.y, Globals.Screen.width, "center")
end

return GameWorld
