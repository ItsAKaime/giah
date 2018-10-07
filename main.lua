function love.load(args)
  love.graphics.setDefaultFilter("nearest", "nearest")
  
  --Modules
  require "module.helper"
  require "module.tiledmap"
  Class = require "module.hump.class"
  GameState = require "module.hump.gamestate"
  Timer = require "module.hump.timer"
  moonshine = require "module/moonshine"

  --Scenes
  menu = require "scenes/menu"
  game = require "scenes/game"

  --Set up screen filter
  screen = moonshine(moonshine.effects.sketch)
              .chain(moonshine.effects.crt)
              .chain(moonshine.effects.scanlines)
              .chain(moonshine.effects.chromasep)
              .chain(moonshine.effects.vignette)
  screen.parameters = {
    scanlines= { frequency = love.graphics.getHeight(), phase = 1, opacity = 0.4 },
    chromasep = { angle = math.rad(90), radius = 2  }
  }
  
  --Set GameStates
  GameState.registerEvents()
  GameState.switch(game)
end