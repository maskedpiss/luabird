local Play = {}

function Play.onEnter()
  Globals.GameWorld = require("src/objs/gameworld")
  Globals.GameWorld:load()
end


function Play.update(dt)
  Globals.GameWorld:update(dt)
end


function Play.draw()
  Globals.GameWorld:draw()
end


function Play.onExit()
  
end

return Play
