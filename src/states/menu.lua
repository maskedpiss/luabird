local Menu = {}

local playButton = nil

function Menu.onEnter()
  Menu.Title = {
      font = love.graphics.newFont(64),
      x = Globals.Screen.x,
      y = 50,
      text = "Lua Bird"
  }
  
  playButton = Globals.Button.new("Play", Globals.Screen.width / 2, Globals.Screen.height / 2)
end


function Menu.update(dt)
  
end


function Menu.draw()
  love.graphics.setBackgroundColor(0, 0.59, 1)
  
  love.graphics.setColor(0, 0, 0)
  love.graphics.setFont(Menu.Title.font)
  love.graphics.printf(Menu.Title.text, Menu.Title.x, Menu.Title.y, Globals.Screen.width, "center")
  
  playButton:draw()
end


function Menu.onExit()
  
end

return Menu
