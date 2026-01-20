local Pipe = {}

function Pipe:load()
  self.TopPipe = {
      x = 200,
      y = Globals.Screen.y,
      width = 75,
      height = math.random(50, 250)
  }
  
  self.MiddleGap = {}
  self.BottomPipe = {}
end


function Pipe:update(dt)
  
end


function Pipe:draw()
  love.graphics.setColor(0, 1, 0)
  love.graphics.rectangle("fill", self.TopPipe.x, self.TopPipe.y, self.TopPipe.width, self.TopPipe.height)
end

return Pipe
