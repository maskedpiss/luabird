local Player = {}

function Player:load()
  self.x = 75
  self.y = Globals.Screen.height / 2
  self.width = 20
  self.height = self.width
  self.gravity = 500
  self.yVel = 0
end


function Player:update(dt)
  self.yVel = self.yVel + self.gravity * dt
  self.y = self.y + self.yVel * dt
end


function Player:draw()
  love.graphics.setColor(1, 1, 0.39)
  love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

return Player
