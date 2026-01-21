local Graphics = {}

function Graphics:loadColors()
  self.black = { 0, 0, 0 }
  self.lightBlue = { 0, 0.59, 1 }
  self.lightGreen = { 0.24, 1, 0.24 }
  self.green = { 0, 1, 0 }
  self.yellow = { 1, 1, 0.39 }
  self.white = { 1, 1, 1 }
end


function Graphics:loadFonts()
  self.Fonts = {
      TitleFont = love.graphics.newFont(64),
      HiScoreFont = love.graphics.newFont(48),
      ButtonFont = love.graphics.newFont(32)
  }
end

return Graphics
