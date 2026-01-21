local Button = {}

Button.offset = 50

function Button.new(sprite, x, y, callback)
  local instance = {}
  setmetatable(instance, { __index = Button })
  
  instance.sprite = sprite
  instance.x = x
  instance.y = y
  instance.callback = callback or function() end
  instance.width = 100
  instance.height = 50
  
  return instance
end


function Button:update(dt)
  
end


function Button:isHovering(x, y)
  return x > self.x and x < self.x + self.width and
         y > self.y and y < self.y + self.height
end


function Button:mousepressed(x, y, button)
  if button == 1 and self:isHovering(x, y) then
    self.callback()
    return true
  end
  return false
end


function Button:draw()
  love.graphics.setColor(Globals.Graphics.white)
  love.graphics.draw(self.sprite, self.x, self.y)
end

return Button
