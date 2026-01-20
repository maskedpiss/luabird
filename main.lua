Globals = {}
Globals.GameWorld = nil
Globals.Player = nil
Globals.Pipe = nil
Globals.playerScore = 0
Globals.hasScored = false
Globals.Collisions = require("src/utils/collisions")

Globals.State = {
    current = nil,
    states = {
        menu = require("src/states/menu")
    }
}

function Globals.State:changeState(newState)
  if Globals.State.current and Globals.State.current.onExit then
    Globals.State.current.onExit()
  end
  
  Globals.State.current = Globals.State.states[newState]
  
  if Globals.State.current and Globals.State.current.onEnter then
    Globals.State.current.onEnter()
  end
end


function love.load()
  Globals.Screen = {
      x = 0,
      y = 0,
      width = love.graphics.getWidth(),
      height = love.graphics.getHeight()
  }
  
  Globals.State:changeState("menu")
end


function love.update(dt)
  if Globals.State.current and Globals.State.current.update then
    Globals.State.current.update(dt)
  end
end


function love.draw()
  if Globals.State.current and Globals.State.current.draw then
    Globals.State.current.draw()
  end
end


function love.mousepressed(x, y, button)
  if Globals.State.current and Globals.State.current.mousepressed then
    Globals.State.current.mousepressed(x, y, button)
  end
end
