local BackGround = {}

function BackGround.new()
  local instance = {}
  setmetatable(instance, { __index = BackGround })
  
  instance:reset()
  
  return instance
end


function BackGround:reset()
  self.sprite = Globals.Graphics.Sprites.BG
  self.x = Globals.Screen.x
  self.y = Globals.Screen.y
  self.width = self.sprite:getWidth()
  self.speed = 50
end


function BackGround:update(dt)
  self.x = self.x - self.speed * dt
  
  if self.x + self.width < Globals.Screen.x then
    self:reset()
  end
end


function BackGround:draw()
  love.graphics.setColor(Globals.Graphics.white)
  love.graphics.draw(self.sprite, self.x, self.y)
  love.graphics.draw(self.sprite, self.x + self.width, self.y)
end

return BackGround
