p = require "entities.player"
game = {}
-- Scene Variables
entities = {}
currentZone = "dungeon"

function game:enter()
  m = loadTiledMap("res/zones/"..currentZone)
  p:new(31, 22)
end

function game:update(dt)
  for _, entity in ipairs(entities) do
    entity:update()
  end
end

function game:draw()
  camera:set()
  m:draw()
  
  for _, entity in ipairs(entities) do
    entity:draw()
  end
  camera:unset()
end

function game:keypressed(key, sc, r)
  if key == "escape" then love.event.quit() end
  if p.canMove == true and key == "right" or p.canMove == true and key == "d" then
    p.vx = p.vx + p.speed
    p.canMove = false
  elseif p.canMove == true and key == "left" or p.canMove == true and key == "a" then
    p.vx = p.vx - p.speed
    p.canMove = false
  elseif p.canMove == true and key == "up" or p.canMove == true and key == "w" then
    p.vy = p.vy - p.speed
    p.canMove = false
  elseif p.canMove == true and key == "down" or p.canMove == true and key == "s" then
    p.vy = p.vy + p.speed
    p.canMove = false
  end
end

return game