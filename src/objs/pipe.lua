local Pipe = {}

function Pipe:load()
  self.TopPipe = {
      x = 200,
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
  
end


function Pipe:draw()
  love.graphics.setColor(0, 1, 0)
  love.graphics.rectangle("fill", self.TopPipe.x, self.TopPipe.y, self.TopPipe.width, self.TopPipe.height)
  love.graphics.rectangle("fill", self.BottomPipe.x, self.BottomPipe.y, self.BottomPipe.width, self.BottomPipe.height)
end

return Pipe
