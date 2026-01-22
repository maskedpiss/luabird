local Ground = {}

function Ground.new()
  local instance = {}
  setmetatable(instance, { __index = Ground })
  
  instance:reset()
  
  return instance
end


function Ground:reset()
  self.sprite = Globals.Graphics.Sprites.ground
  self.x = Globals.Screen.x
  self.y = Globals.Screen.height - self.sprite:getHeight()
  self.width = self.sprite:getWidth()
  self.height = self.sprite:getHeight()
  self.speed = 200
end


function Ground:update(dt)
  self.x = self.x - self.speed * dt
  
  if self.x + self.width < Globals.Screen.x then
    self:reset()
  end
end


function Ground:draw()
  love.graphics.setColor(Globals.Graphics.white)
  love.graphics.draw(self.sprite, self.x, self.y)
  love.graphics.draw(self.sprite, self.x + self.width, self.y)
end

return Ground
