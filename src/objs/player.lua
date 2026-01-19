local Player = {}

function Player.new()
  local instance = {}
  setmetatable(instance, { __index = Player })
  
  instance:reset()
  
  return instance
end


function Player:reset()
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


function Player:flap()
  if self.y > Globals.Screen.y then
    self.yVel = -250
  end
end


function Player:draw()
  love.graphics.setColor(1, 1, 0.39)
  love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

return Player
