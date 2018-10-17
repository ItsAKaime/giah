-- Bootsrapping
love.graphics.setDefaultFilter("nearest", "nearest")
love.window.setMode(800, 600, { resizable = true, highdpi = true})
canvas = love.graphics.newCanvas(240, 136)

function love.load(args)
  --Modules
  require "module.tiledmap"
  require "module.helpers"
  Camera = require "module.camera"
  moonshine = require "module/moonshine"

  -- Default tileset
  ts_image = love.graphics.newImage("res/tileset.png")

  --Scenes
  menu = require "scenes/menu"
  game = require "scenes/game"

  set_scene(menu)
end

function love.update(dt)
  if currentScene.update ~= nil then currentScene:update() end
end

function love.draw()
  love.graphics.setCanvas(canvas)
  love.graphics.clear(0, 0, 0)
  if currentScene.draw ~= nil then currentScene:draw() end
  love.graphics.setCanvas()
  
  local sW, sH = love.graphics.getDimensions()
  local cW, cH = canvas:getDimensions()
  local scale = math.min(sW / cW, sH / cH)
  
  love.graphics.push()
  love.graphics.translate(math.floor((sW - cW * scale) / 2), math.floor((sH - cH * scale) / 2))
  love.graphics.scale(scale, scale)
  love.graphics.draw(canvas)
  love.graphics.pop()
  love.graphics.setScissor(0, 0, sW, sH)
end

function love.keypressed(key, sc, r)
  if currentScene.keypressed ~= nil then currentScene:keypressed(key, sc, r) end
end