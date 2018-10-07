p = require "entities/player"
Camera = require "module.camera"

game = {}

function game:enter()
  m = loadTiledMap("res/tilemap")
  p:new(1, 1)
  camera = Camera(p.x, p.y, 4)
  camera.smoother = Camera.smooth.damped(10)
end

function game:update(dt)
  p:update(dt)
  camera:lockPosition(p.x, p.y, Camera.smooth.damped(2))
end

function game:draw()
  camera:attach()
  m:draw()
  p:draw()
  camera:detach()
end

function game:keypressed(key)
  if p.canMove == true and key == "right" or key == "d" then
    p:setDir(1, 0)
    p.vx = p.vx + p.speed
    p.canMove = false
  elseif p.canMove == true and key == "left" or key == "a" then
    p:setDir(-1, 0)
    p.vx = p.vx - p.speed
    p.canMove = false
  elseif p.canMove == true and key == "up" or key == "w" then
    p:setDir(-1, 0)
    p.vy = p.vy - p.speed
    p.canMove = false
  elseif p.canMove == true and key == "down" or key == "s" then
    p:setDir(1, 0)
    p.vy = p.vy + p.speed
    p.canMove = false
  end
end

return game