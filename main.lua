Globals = {}
Globals.GameWorld = nil
Globals.Player = nil

function love.load()
  Globals.Screen = {
      x = 0,
      y = 0,
      width = love.graphics.getWidth(),
      height = love.graphics.getHeight()
  }
  
  Globals.GameWorld = require("src/objs/gameworld")
  Globals.GameWorld:load()
  
  Globals.Player = require("src/objs/player")
  Globals.Player:load()
end


function love.update(dt)
  Globals.GameWorld:update(dt)
  Globals.Player:update(dt)
end


function love.draw()
  Globals.GameWorld:draw()
  Globals.Player:draw()
end
