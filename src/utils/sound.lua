local Sound = {}

function Sound:loadSFX()
  self.buttonPressed = love.audio.newSource("res/sound/ButtonPress.wav", "static")
  self.flap = love.audio.newSource("res/sound/Flap.wav", "static")
  self.goal = love.audio.newSource("res/sound/Goal.wav", "static")
  self.thud = love.audio.newSource("res/sound/Thud.wav", "static")
end


function Sound:playSound(sound)
  love.audio.stop()
  love.audio.play(sound)
end

return Sound
