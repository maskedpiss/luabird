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
      TitleFont = love.graphics.newFont("res/fonts/BLACKOUT.TTF", 64),
      HiScoreFont = love.graphics.newFont("res/fonts/BLACKOUT.TTF", 48),
      ButtonFont = love.graphics.newFont("res/fonts/BLACKOUT.TTF", 32)
  }
end


function Graphics:loadSprites()
  self.Sprites = {
      BG = love.graphics.newImage("res/sprites/BG.png")
  }
end

return Graphics
