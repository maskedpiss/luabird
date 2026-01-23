local Sound = {}

function Sound:loadSFX()
  self.buttonPressed = love.audio.newSource("res/sound/ButtonPress.wav", "static")
  self.flap = love.audio.newSource("res/sound/Flap.wav", "static")
end


function Sound:playSound(sound)
  love.audio.stop()
  love.audio.play(sound)
end

return Sound
