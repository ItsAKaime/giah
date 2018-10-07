love.graphics.setDefaultFilter("nearest", "nearest")
--Modules
require "module/tiledmap"
Class = require "module/class"
GameState = require "module/gamestate"
Timer = require "module/timer"

--Scenes
menu = require "scenes/menu"
game = require "scenes/game"

--Fullscreen
fs = false

function love.load(args)
  --Set GameStates
  GameState.registerEvents()
  GameState.switch(game)
end

function love.keypressed(key)
  --Handle quiting and fullscreen
  if key == "tab" then love.mouse.setVisible(not love.mouse.isVisible()) end
  if key == "escape" then love.event.quit() end
  if key == "f11" then
    fs = not fs
    if fs == true then love.window.setMode(800, 600, {fullscreen = true, fullscreentype = "exclusive"})
    elseif fs == false then love.window.setMode(800, 600, {fullscreen = false}) end
  end
end