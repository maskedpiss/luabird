local Pipe = {}

function Pipe.new()
  local instance = {}
  setmetatable(instance, { __index = Pipe })
  
  instance:reset()
  
  return instance
end


function Pipe:reset()
  self.speed = 200
  
  self.TopPipe = {
      x = Globals.Screen.width,
      y = Globals.Screen.y,
      width = 75,
      height = math.random(50, 250)
  }
  
  self.MiddleGap = {
      x = self.TopPipe.x,
      y = self.TopPipe.y + self.TopPipe.height,
      width = self.TopPipe.width,
      height = 100
  }
  
  self.BottomPipe = {
      x = self.TopPipe.x,
      y = self.MiddleGap.y + self.MiddleGap.height,
      width = 75,
      height = Globals.Screen.height
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
  love.graphics.setColor(0, 1, 0)
  love.graphics.rectangle("fill", self.TopPipe.x, self.TopPipe.y, self.TopPipe.width, self.TopPipe.height)
  love.graphics.rectangle("fill", self.BottomPipe.x, self.BottomPipe.y, self.BottomPipe.width, self.BottomPipe.height)
end

return Pipe
