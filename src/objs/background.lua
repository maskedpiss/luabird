local BackGround = {}

function BackGround.new()
  local instance = {}
  setmetatable(instance, { __index = BackGround })
  
  instance.sprite = Globals.Graphics.Sprites.BG
  instance.x = Globals.Screen.x
  instance.y = Globals.Screen.y
  
  return instance
end


function BackGround:update(dt)
  
end


function BackGround:draw()
  love.graphics.setColor(Globals.Graphics.white)
  love.graphics.draw(self.sprite, self.x, self.y)
end

return BackGround
