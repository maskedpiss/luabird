local GameWorld = {}

function GameWorld:load()
  self.BG = { 0, 0.59, 1 }
  self.Ground = {}
end


function GameWorld:update(dt)
  
end


function GameWorld:draw()
  love.graphics.setBackgroundColor(self.BG)
end

return GameWorld
