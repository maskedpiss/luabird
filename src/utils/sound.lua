local Sound = {}

function Sound:loadSFX()
  self.buttonPressed = love.audio.newSource("res/sound/ButtonPress.wav", "static")
end

return Sound
