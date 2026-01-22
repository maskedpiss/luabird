local Pipe = {}

function Pipe.new()
  local instance = {}
  setmetatable(instance, { __index = Pipe })
  
  instance:reset()
  
  return instance
end


function Pipe:reset()
  self.sprite1 = Globals.Graphics.Sprites.pipeShaft
  self.sprite2 = Globals.Graphics.Sprites.pipeCap
  self.speed = 200
  Globals.hasScored = false
  
  self.MiddleGap = {
      x = Globals.Screen.width,
      y = math.random(50, 250),
      width = self.sprite1:getWidth(),
      height = 100
  }
  
  self.TopPipe = {
      x = Globals.Screen.width,
      y = self.MiddleGap.y - self.sprite1:getHeight(),
      width = 75,
      height = self.sprite1:getHeight()
  }
  
  self.BottomPipe = {
      x = self.TopPipe.x,
      y = self.MiddleGap.y + self.MiddleGap.height,
      width = 75,
      height = self.sprite1:getHeight()
  }
end


function Pipe:update(dt)
  self.TopPipe.x = self.TopPipe.x - self.speed * dt
  self.BottomPipe.x = self.TopPipe.x
  
  if self.TopPipe.x + self.TopPipe.width < Globals.Screen.x then
    self:reset()
  end
end


function Pipe:draw()
  love.graphics.setColor(Globals.Graphics.white)
  love.graphics.draw(self.sprite1, self.TopPipe.x, self.TopPipe.y)
  love.graphics.draw(self.sprite1, self.TopPipe.x, self.TopPipe.y - self.TopPipe.height)
  love.graphics.draw(self.sprite2, self.TopPipe.x, (self.TopPipe.y + self.TopPipe.height) - self.sprite2:getHeight())
  
  love.graphics.draw(self.sprite1, self.BottomPipe.x, self.BottomPipe.y)
  love.graphics.draw(self.sprite1, self.BottomPipe.x, self.BottomPipe.y + self.BottomPipe.height)
  love.graphics.draw(self.sprite2, self.BottomPipe.x, self.BottomPipe.y)
end

return Pipe
