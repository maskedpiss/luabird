Globals = {}
Globals.GameWorld = nil

function love.load()
  Globals.Screen = {
      x = 0,
      y = 0,
      width = love.graphics.getWidth(),
      height = love.graphics.getHeight()
  }
  
  Globals.GameWorld = require("src/objs/gameworld")
  Globals.GameWorld:load()
end


function love.update(dt)
  Globals.GameWorld:update(dt)
end


function love.draw()
  Globals.GameWorld:draw()
end
