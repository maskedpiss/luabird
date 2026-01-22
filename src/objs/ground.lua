local Ground = {}

function Ground.new()
  local instance = {}
  setmetatable(instance, { __index = Ground })
  
  instance.sprite = Globals.Graphics.Sprites.ground
  instance.x = Globals.Screen.x
  instance.y = Globals.Screen.height - instance.sprite:getHeight()
  instance.width = instance.sprite:getWidth()
  
  return instance
end


function Ground:update(dt)
  
end


function Ground:draw()
  love.graphics.setColor(Globals.Graphics.white)
  love.graphics.draw(self.sprite, self.x, self.y)
end

return Ground
