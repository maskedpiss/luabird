local Menu = {}

local playButton = nil
local exitButton = nil

function Menu.onEnter()
  Menu.Title = {
      font = love.graphics.newFont(64),
      x = Globals.Screen.x,
      y = 50,
      text = "Lua Bird"
  }
  
  local playBtnX = Globals.Screen.width / 2
  local playBtnY = Globals.Screen.height / 2
  local exitBtnX = playBtnX
  local exitBtnY = playBtnY + 75
  
  playButton = Globals.Button.new("Play", playBtnX, playBtnY, function()
      Globals.State:changeState("play")
    end)
  
  exitButton = Globals.Button.new("Exit", exitBtnX, exitBtnY, function()
      love.event.quit()
    end)
end


function Menu.update(dt)
  
end


function Menu.mousepressed(x, y, button)
  if playButton:mousepressed(x, y, button) then
    return
  end
  
  if exitButton:mousepressed(x, y, button) then
    return
  end
end


function Menu.draw()
  love.graphics.setBackgroundColor(0, 0.59, 1)
  
  love.graphics.setColor(0, 0, 0)
  love.graphics.setFont(Menu.Title.font)
  love.graphics.printf(Menu.Title.text, Menu.Title.x, Menu.Title.y, Globals.Screen.width, "center")
  
  playButton:draw()
  exitButton:draw()
end


function Menu.onExit()
  
end

return Menu
