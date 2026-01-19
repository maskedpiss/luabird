local Player = {}

function Player:load()
  self.x = 75
  self.y = Globals.Screen.height / 2
  self.width = 20
  self.height = self.width
end


function Player:update(dt)
  
end


function Player:draw()
  love.graphics.setColor(1, 1, 0.39)
  love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

return Player
